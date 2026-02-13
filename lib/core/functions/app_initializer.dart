import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/custom_bloc_observer.dart';
import 'package:flux_store/core/helpers/shared_pref_helper.dart';
import 'package:flux_store/core/hive/initialize_hive_services.dart';
import 'package:flux_store/core/routes/app_router.dart';

import 'package:flux_store/firebase_options.dart';

import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flux_store/core/services/push_notification_service.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_cubit.dart';
import 'package:flux_store/features/home/data/models/notification_model.dart';
import 'package:flux_store/core/helpers/notification_logic_helper.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp();
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(10)) {
      Hive.registerAdapter(NotificationModelAdapter());
    }
    final box = await Hive.openBox<NotificationModel>('notifications_box');
    final title =
        message.notification?.title ??
        message.data['title']?.toString() ??
        'Flux Store';
    final body =
        message.notification?.body ?? message.data['body']?.toString() ?? '';

    final notification = NotificationModel(
      id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      body: body,
      timestamp: DateTime.now().toString().substring(11, 16),
      type: message.data['type']?.toString() ?? 'system',
      isRead: false,
      payload: message.data,
    );
    await box.put(notification.id, notification);

    // Show local notification so it's visible even when app is closed
    final localNotifications = FlutterLocalNotificationsPlugin();
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'flux_store_channel',
      'Flux Store Notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      icon: 'ic_notification',
    );
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: DarwinNotificationDetails(),
    );

    await localNotifications.show(
      DateTime.now().millisecondsSinceEpoch % 2147483647,
      title,
      body,
      platformChannelSpecifics,
      payload: json.encode(message.data),
    );
  } catch (e) {
    debugPrint("Background notification handler failed: $e");
  }
}

class AppInitializer {
  static Future<void> initCore() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeHiveServices();
    await ScreenUtil.ensureScreenSize();
    await setupGetIt();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Bloc.observer = CustomBlocObserver();

    // Initialize Notification Service
    await _initNotifications();
  }

  static Future<void> _initNotifications() async {
    try {
      if (kDebugMode) {
        print('═══════════════════════════════════════');
        print('🔥 INITIALIZING FIREBASE');
        print('═══════════════════════════════════════');
      }

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      if (kDebugMode) {
        print('✅ Firebase initialized successfully');
        print('📡 Subscribing to topic: "all"');
      }

      await FirebaseMessaging.instance.subscribeToTopic('all');

      if (kDebugMode) {
        print('✅ Subscribed to topic "all"');
      }

      final pushService = getIt<PushNotificationService>();
      await pushService.initialize();

      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      final fcmToken = await pushService.getToken();
      if (kDebugMode) {
        if (fcmToken != null) {
          print('✅ FCM Token retrieved successfully');
        } else {
          print('⚠️ FCM Token is NULL');
        }
      }

      // Handle foreground messages
      pushService.onMessageReceived.listen((message) {
        _saveNotification(message);
      });

      // Handle notification taps globally
      pushService.onNotificationTapped.listen((message) {
        _saveNotification(message);
        if (getIt.isRegistered<GoRouter>()) {
          NotificationLogicHelper.handleNotificationNavigation(
            getIt<GoRouter>(),
            message.data,
          );
        }
      });

      if (kDebugMode) {
        print('═══════════════════════════════════════');
        print('✅ FIREBASE SETUP COMPLETE');
        print('═══════════════════════════════════════');
      }
    } catch (e) {
      debugPrint("❌ Firebase/Notification initialization failed: $e");
    }
  }

  static void _saveNotification(RemoteMessage message) {
    final title =
        message.notification?.title ??
        message.data['title']?.toString() ??
        'Flux Store';
    final body =
        message.notification?.body ?? message.data['body']?.toString() ?? '';

    final notification = NotificationModel(
      id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      body: body,
      timestamp: DateTime.now().toString().substring(11, 16), // HH:mm
      type: message.data['type']?.toString() ?? 'system',
      isRead: false,
      payload: message.data,
    );
    getIt<NotificationsCubit>().addNotification(notification);
  }

  static Future<void> initRouter() async {
    final isNotFirstLogin = await SharedPrefHelper.getBool(
      AppConstants.prefsIsNotFirstLogin,
    );
    final token = await SharedPrefHelper.getSecuredString(
      AppConstants.prefsAccessToken,
    );

    if (!getIt.isRegistered<GoRouter>()) {
      getIt.registerSingleton<GoRouter>(
        AppRouter.getRouter(isNotFirstLogin: isNotFirstLogin, token: token),
      );
    }
  }

  static Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  FirebaseMessaging? _fcm;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // Stream for handling notification clicks in app
  final StreamController<RemoteMessage> _onNotificationTappedController =
      StreamController<RemoteMessage>.broadcast();
  Stream<RemoteMessage> get onNotificationTapped =>
      _onNotificationTappedController.stream;

  // Stream for handling incoming foreground messages
  final StreamController<RemoteMessage> _onMessageReceivedController =
      StreamController<RemoteMessage>.broadcast();
  Stream<RemoteMessage> get onMessageReceived =>
      _onMessageReceivedController.stream;

  bool get isInitialized => _fcm != null;

  Future<void> initialize() async {
    try {
      _fcm = FirebaseMessaging.instance;
    } catch (e) {
      if (kDebugMode) {
        print(
          "FirebaseMessaging can't be initialized (likely missing config): $e",
        );
      }
      // Continue to initialize local notifications so app doesn't crash
    }

    // 2. Setup Local Notifications (Always safe to do)
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          final Map<String, dynamic> data = json.decode(response.payload!);
          _onNotificationTappedController.add(RemoteMessage(data: data));
        }
      },
    );

    // Create Android notification channel for API 26+
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'flux_store_channel', // id
      'Flux Store Notifications', // name
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      showBadge: true,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    if (_fcm == null) return;

    // 1. Request permissions (if FCM is active)
    try {
      NotificationSettings settings = await _fcm!.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (kDebugMode) {
        print('═══════════════════════════════════════');
        print('🔔 NOTIFICATION PERMISSION STATUS');
        print('═══════════════════════════════════════');
        print('Authorization: ${settings.authorizationStatus}');
        print('Alert: ${settings.alert}');
        print('Sound: ${settings.sound}');
        print('Badge: ${settings.badge}');
        print('═══════════════════════════════════════');
      }

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        if (kDebugMode) {
          print('✅ User granted notification permission');
        }
      } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
        if (kDebugMode) {
          print('❌ User DENIED notification permission');
        }
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.notDetermined) {
        if (kDebugMode) {
          print('⚠️ Notification permission not determined');
        }
      }

      // 3. Handle Foreground Messages
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (kDebugMode) {
          print('═══════════════════════════════════════');
          print('📩 FOREGROUND MESSAGE RECEIVED');
          print('═══════════════════════════════════════');
          print('Title: ${message.notification?.title}');
          print('Body: ${message.notification?.body}');
          print('Data: ${message.data}');
          print('═══════════════════════════════════════');
        }
        _onMessageReceivedController.add(message);
        _showLocalNotification(message);
      });

      // 4. Handle Background/Terminated Click
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (kDebugMode) {
          print('═══════════════════════════════════════');
          print('🚀 APP OPENED FROM NOTIFICATION');
          print('═══════════════════════════════════════');
          print('Title: ${message.notification?.title}');
          print('Data: ${message.data}');
          print('═══════════════════════════════════════');
        }
        _onNotificationTappedController.add(message);
      });

      // Check if app was opened from a terminated state
      RemoteMessage? initialMessage = await _fcm!.getInitialMessage();
      if (initialMessage != null) {
        if (kDebugMode) {
          print('🎯 App opened from TERMINATED state');
        }
        _onNotificationTappedController.add(initialMessage);
      }
    } catch (e) {
      debugPrint("❌ Error setting up FCM listeners: $e");
    }
  }

  Future<String?> getToken() async {
    if (_fcm == null) {
      if (kDebugMode) {
        print('❌ FCM is not initialized - cannot get token');
      }
      return null;
    }
    try {
      String? token = await _fcm!.getToken();
      if (kDebugMode) {
        print('═══════════════════════════════════════');
        print('🔑 FCM TOKEN');
        print('═══════════════════════════════════════');
        print(token ?? 'NULL TOKEN - FCM may not be configured properly');
        print('═══════════════════════════════════════');
      }
      return token;
    } catch (e) {
      if (kDebugMode) {
        print("❌ Failed to get FCM token: $e");
      }
      return null;
    }
  }

  Future<void> showNotification({
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'flux_store_channel',
          'Flux Store Notifications',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: true,
        );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch % 2147483647,
      title,
      body,
      platformChannelSpecifics,
      payload: payload != null ? json.encode(payload) : null,
    );
  }

  void _showLocalNotification(RemoteMessage message) async {
    await showNotification(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      payload: message.data,
    );
  }

  void dispose() {
    _onNotificationTappedController.close();
    _onMessageReceivedController.close();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/cubit/connection/connection_cubit.dart';
import 'package:flux_store/core/cubit/language/language_cubit.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/no_connection_overlay.dart';
import 'package:flux_store/features/home/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:flux_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flux_store/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flux_store/features/addresses/presentation/cubit/addresses_cubit.dart';
import 'package:flux_store/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_cubit.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColors.transparent,
          ),
        );
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LanguageCubit()),
            BlocProvider(create: (context) => ConnectionCubit()),
            BlocProvider(create: (context) => getIt<BottomNavBarCubit>()),
            BlocProvider(create: (context) => getIt<CartCubit>()),
            BlocProvider(
              create: (context) => getIt<WishlistCubit>()..getWishlist(),
            ),
            BlocProvider(
              create: (context) => getIt<AddressesCubit>()..getAddresses(),
            ),
            BlocProvider(create: (context) => getIt<OrdersCubit>()),
            BlocProvider(
              create: (context) =>
                  getIt<NotificationsCubit>()..getNotifications(),
            ),
          ],
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              LanguageCubit cubit = context.read<LanguageCubit>();
              return Directionality(
                textDirection: cubit.locale == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Stack(
                  children: [
                    MaterialApp.router(
                      theme: ThemeData(
                        useMaterial3: true,
                        primaryColor: AppColors.primary,
                        scaffoldBackgroundColor: AppColors.background,
                        fontFamily: 'Tajawal',
                        textTheme: TextTheme(
                          displayLarge: AppTextStyles.font24BlackBold,
                          headlineMedium: AppTextStyles.font18BlackBold,
                          titleMedium: AppTextStyles.font16BlackMedium,
                          bodyLarge: AppTextStyles.font14BlackRegular,
                          bodyMedium: AppTextStyles.font12BlackMedium,
                        ),
                        elevatedButtonTheme: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.white,
                            elevation: 4,
                            shadowColor: AppColors.black.withValues(alpha: 0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            textStyle: AppTextStyles.font16WhiteSemiBold,
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 12.h,
                            ),
                          ),
                        ),
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: AppColors.greySubtle,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 16.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 1.5,
                            ),
                          ),
                          hintStyle: AppTextStyles.font14GreyMedium,
                          labelStyle: AppTextStyles.font14GreyMedium,
                        ),
                        cardTheme: CardThemeData(
                          color: AppColors.white,
                          elevation: 8,
                          shadowColor: AppColors.black.withValues(alpha: 0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        appBarTheme: AppBarTheme(
                          backgroundColor: AppColors.background,
                          elevation: 0,
                          centerTitle: true,
                          titleTextStyle: AppTextStyles.font18BlackBold,
                          iconTheme: const IconThemeData(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      locale: Locale(cubit.locale),
                      debugShowCheckedModeBanner: false,
                      routerConfig: getIt<GoRouter>(),
                    ),
                    const NoConnectionOverlay(),
                    Positioned(
                      bottom: 180,
                      right: 20,
                      child: FloatingActionButton(
                        backgroundColor: AppColors.primary,
                        onPressed: () {
                          context.read<LanguageCubit>().toggleLanguage();
                        },
                        child: const Icon(
                          Icons.language,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

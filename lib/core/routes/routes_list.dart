import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'package:flux_store/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:flux_store/features/cart/presentation/screens/cart_view.dart';
import 'package:flux_store/core/models/product_ui_model.dart';
import 'routes_import.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/features/search/presentation/cubit/search_cubit.dart';
import 'package:flux_store/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flux_store/features/settings/presentation/screens/language_view.dart';
import 'package:flux_store/features/settings/presentation/screens/static_content_view.dart';
import 'package:flux_store/features/settings/presentation/screens/profile_detail_view.dart';

class RoutesList {
  static final List<RouteBase> all = [
    GoRoute(
      path: MenuView.routeName,
      builder: (context, state) => const MenuView(),
    ),
    GoRoute(
      path: WelcomeView.routeName,
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(
      path: OnboardingView.routeName,
      builder: (context, state) => const OnboardingView(),
    ),
    //ToDo: Auth ---------------------------------------------------------
    GoRoute(
      path: LoginView.routeName,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: GetEmailView.routeName,
      builder: (context, state) => const GetEmailView(),
    ),
    GoRoute(
      path: VerificationView.routeName,
      builder: (context, state) => VerificationView(userId: state.extra as int),
    ),
    GoRoute(
      path: RegisterView.routeName,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: VerificationForgotPasswordView.routeName,
      builder: (context, state) =>
          VerificationForgotPasswordView(email: state.extra as String),
    ),
    GoRoute(
      path: ResetPasswordView.routeName,
      builder: (context, state) {
        final Map<String, String> extra = state.extra as Map<String, String>;
        return ResetPasswordView(
          email: extra['email']!,
          resetToken: extra['resetToken']!,
        );
      },
    ),
    GoRoute(
      path: AuthSuccessView.routeName,
      builder: (context, state) => const AuthSuccessView(),
    ),
    //ToDo: Home ---------------------------------------------------------
    GoRoute(
      path: BottomNavBarView.routeName,
      builder: (context, state) => const BottomNavBarView(),
    ),
    GoRoute(
      path: HomeView.routeName,
      builder: (context, state) => const HomeView(),
    ),

    //ToDo: Discover ---------------------------------------------------------
    GoRoute(
      path: DiscoverView.routeName,
      builder: (context, state) => const DiscoverView(),
    ),

    GoRoute(
      path: SearchView.routeName,
      builder: (context, state) => BlocProvider.value(
        value: getIt<SearchCubit>(),
        child: const SearchView(),
      ),
    ),
    GoRoute(
      path: FoundResultView.routeName,
      builder: (context, state) => BlocProvider.value(
        value: getIt<SearchCubit>(),
        child: const FoundResultView(),
      ),
    ),
    GoRoute(
      path: ProductDetailsView.routeName,
      builder: (context, state) =>
          ProductDetailsView(product: state.extra as ProductUIModel),
    ),
    GoRoute(
      path: CheckoutSuccessView.routeName,
      builder: (context, state) => const CheckoutSuccessView(),
    ),
    GoRoute(
      path: CheckoutView.routeName,
      builder: (context, state) => const CheckoutView(),
    ),
    GoRoute(
      path: PaymentView.routeName,
      builder: (context, state) => BlocProvider.value(
        value: getIt<OrdersCubit>(),
        child: PaymentView(selectedAddress: state.extra as AddressModel),
      ),
    ),
    GoRoute(
      path: MyOrdersView.routeName,
      builder: (context, state) => BlocProvider.value(
        value: getIt<SettingsCubit>(),
        child: const MyOrdersView(),
      ),
    ),
    GoRoute(
      path: OrderDetailView.routeName,
      builder: (context, state) =>
          OrderDetailView(orderId: state.extra as String?),
    ),
    GoRoute(
      path: RateProductView.routeName,
      builder: (context, state) => const RateProductView(),
    ),
    GoRoute(
      path: ShippingAddressesView.routeName,
      builder: (context, state) => const ShippingAddressesView(),
    ),
    GoRoute(
      path: PaymentMethodsView.routeName,
      builder: (context, state) => const PaymentMethodsView(),
    ),
    GoRoute(
      path: SettingsView.routeName,
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(
      path: MyReviewsView.routeName,
      builder: (context, state) => const MyReviewsView(),
    ),
    GoRoute(
      path: WishlistView.routeName,
      builder: (context, state) => const WishlistView(),
    ),
    GoRoute(
      path: NotificationsView.routeName,
      builder: (context, state) => const NotificationsView(),
    ),
    GoRoute(
      path: OrderTrackingView.routeName,
      builder: (context, state) => const OrderTrackingView(),
    ),
    GoRoute(
      path: VoucherView.routeName,
      builder: (context, state) => const VoucherView(),
    ),
    GoRoute(
      path: LanguageView.routeName,
      builder: (context, state) => const LanguageView(),
    ),
    GoRoute(
      path: '/about-us',
      builder: (context, state) => const StaticContentView(
        title: "About Us",
        content:
            "FluxStore is your premier destination for high-quality clothing and fashion. We are committed to providing our customers with the latest trends and best shopping experience. Our mission is to make fashion accessible and enjoyable for everyone.",
      ),
    ),
    GoRoute(
      path: '/privacy-policy',
      builder: (context, state) => const StaticContentView(
        title: "Privacy Policy",
        content:
            "We value your privacy. Your data is protected and used only to improve our services. We do not share your personal information with third parties without your consent. By using FluxStore, you agree to our data collection and usage policies.",
      ),
    ),
    GoRoute(
      path: '/terms-of-service',
      builder: (context, state) => const StaticContentView(
        title: "Terms of Service",
        content:
            "By using our app, you agree to comply with our policies. FluxStore provides its services subject to these terms. We reserve the right to update these terms at any time. Your continued use of the app constitutes acceptance of any changes.",
      ),
    ),
    GoRoute(
      path: ChangePasswordView.routeName,
      builder: (context, state) => const ChangePasswordView(),
    ),
    GoRoute(
      path: ProfileDetailView.routeName,
      builder: (context, state) => BlocProvider.value(
        value: getIt<SettingsCubit>(),
        child: const ProfileDetailView(),
      ),
    ),
    // Cart ---------------------------------------------------------
    GoRoute(
      path: CartView.routeName,
      builder: (context, state) => const CartView(),
    ),
  ];
}

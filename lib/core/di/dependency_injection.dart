import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';
import 'package:flux_store/core/services/country_service.dart';
import 'package:flux_store/features/home/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:flux_store/features/cart/presentation/cubit/cart_cubit.dart'
    as cart_logic;

// Feature API Services
import 'package:flux_store/features/auth/data/apis/auth_api_service.dart';
import 'package:flux_store/features/home/data/apis/home_api_service.dart';
import 'package:flux_store/features/search/data/apis/search_api_service.dart';
import 'package:flux_store/features/cart/data/apis/cart_api_service.dart';
import 'package:flux_store/features/settings/data/apis/settings_api_service.dart';
import 'package:flux_store/features/categories/data/apis/categories_api_service.dart';
import 'package:flux_store/features/products/data/apis/products_api_service.dart';
import 'package:flux_store/features/brands/data/apis/brands_api_service.dart';
import 'package:flux_store/features/wishlist/data/apis/wishlist_api_service.dart';
import 'package:flux_store/features/addresses/data/apis/addresses_api_service.dart';
import 'package:flux_store/features/orders/data/apis/orders_api_service.dart';
import 'package:flux_store/core/services/push_notification_service.dart';

// Feature Repositories
import 'package:flux_store/features/auth/domain/repositories/auth_repository.dart';
import 'package:flux_store/features/auth/data/repos/auth_repository_impl.dart';

// Feature UseCases
import 'package:flux_store/features/auth/domain/usecases/login_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/signup_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/verify_reset_code_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/update_me_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/change_password_use_case.dart';
import 'package:flux_store/features/home/data/repos/home_repo.dart';
import 'package:flux_store/features/search/data/repos/search_repo.dart';
import 'package:flux_store/features/cart/domain/repositories/cart_repository.dart';
import 'package:flux_store/features/cart/data/repos/cart_repository_impl.dart';
import 'package:flux_store/features/settings/data/repos/settings_repo.dart';
import 'package:flux_store/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:flux_store/features/wishlist/data/repos/wishlist_repository_impl.dart';
import 'package:flux_store/features/categories/domain/repositories/categories_repository.dart';
import 'package:flux_store/features/categories/data/repos/categories_repository_impl.dart';
import 'package:flux_store/features/products/domain/repositories/products_repository.dart';
import 'package:flux_store/features/products/data/repos/products_repository_impl.dart';
import 'package:flux_store/features/brands/domain/repositories/brands_repository.dart';
import 'package:flux_store/features/brands/data/repos/brands_repository_impl.dart';
import 'package:flux_store/features/addresses/domain/repositories/addresses_repository.dart';
import 'package:flux_store/features/addresses/data/repos/addresses_repository_impl.dart';
import 'package:flux_store/features/orders/domain/repositories/orders_repository.dart';
import 'package:flux_store/features/orders/data/repos/orders_repository_impl.dart';
import 'package:flux_store/features/home/data/repos/notifications_repo.dart';

// Feature Cubits
import 'package:flux_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:flux_store/features/search/presentation/cubit/search_cubit.dart';
import 'package:flux_store/features/addresses/presentation/cubit/addresses_cubit.dart';
import 'package:flux_store/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:flux_store/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flux_store/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flux_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_cubit.dart';
import 'package:flux_store/core/networking/token_interceptor.dart';
// Feature UseCases (Products/Categories/Brands)
import 'package:flux_store/features/categories/domain/usecases/get_categories_use_case.dart';
import 'package:flux_store/features/products/domain/usecases/get_products_use_case.dart';
import 'package:flux_store/features/products/domain/usecases/get_product_details_use_case.dart';
import 'package:flux_store/features/brands/domain/usecases/get_brands_use_case.dart';
import 'package:flux_store/features/brands/domain/usecases/get_brand_details_use_case.dart';

// Feature UseCases (Cart/Wishlist)
import 'package:flux_store/features/cart/domain/usecases/cart_use_cases.dart';
import 'package:flux_store/features/wishlist/domain/usecases/wishlist_use_cases.dart';

// Feature UseCases (Orders/Addresses)
import 'package:flux_store/features/addresses/domain/usecases/address_use_cases.dart';
import 'package:flux_store/features/orders/domain/usecases/order_use_cases.dart';

import 'package:flux_store/features/products/presentation/cubit/product_details_cubit.dart';
import 'package:flux_store/features/products/presentation/cubit/reviews_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //*-------------------------------------- API --------------------------------------*
  Dio dio = await DioFactory.getDio();
  dio.interceptors.add(TokenInterceptor());
  getIt.registerLazySingleton<Dio>(() => dio);

  //*------------------------------- API Services ------------------------------------*
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(getIt()));
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(getIt()));
  getIt.registerLazySingleton<SearchApiService>(
    () => SearchApiService(getIt()),
  );
  getIt.registerLazySingleton<CartApiService>(() => CartApiService(getIt()));
  getIt.registerLazySingleton<SettingsApiService>(
    () => SettingsApiService(getIt()),
  );
  getIt.registerLazySingleton<CategoriesApiService>(
    () => CategoriesApiService(getIt()),
  );
  getIt.registerLazySingleton<ProductsApiService>(
    () => ProductsApiService(getIt()),
  );
  getIt.registerLazySingleton<BrandsApiService>(
    () => BrandsApiService(getIt()),
  );
  getIt.registerLazySingleton<WishlistApiService>(
    () => WishlistApiService(getIt()),
  );
  getIt.registerLazySingleton<AddressesApiService>(
    () => AddressesApiService(getIt()),
  );
  getIt.registerLazySingleton<OrdersApiService>(
    () => OrdersApiService(getIt()),
  );

  //*------------------------------- Repositories ------------------------------------*
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<SettingsRepo>(() => SettingsRepo(getIt()));
  getIt.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<BrandsRepository>(
    () => BrandsRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<AddressesRepository>(
    () => AddressesRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<NotificationsRepository>(
    () => NotificationsRepository(),
  );

  //*------------------------------- Use Cases ---------------------------------------*
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton<SignupUseCase>(() => SignupUseCase(getIt()));
  getIt.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(getIt()),
  );
  getIt.registerLazySingleton<VerifyResetCodeUseCase>(
    () => VerifyResetCodeUseCase(getIt()),
  );
  getIt.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(getIt()),
  );
  getIt.registerLazySingleton<UpdateMeUseCase>(() => UpdateMeUseCase(getIt()));
  getIt.registerLazySingleton<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(getIt()),
  );

  // Categories/Products/Brands UseCases
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetProductDetailsUseCase>(
    () => GetProductDetailsUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetBrandsUseCase>(
    () => GetBrandsUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetBrandDetailsUseCase>(
    () => GetBrandDetailsUseCase(getIt()),
  );

  // Cart UseCases
  getIt.registerLazySingleton<GetCartUseCase>(() => GetCartUseCase(getIt()));
  getIt.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(getIt()),
  );
  getIt.registerLazySingleton<UpdateCartQuantityUseCase>(
    () => UpdateCartQuantityUseCase(getIt()),
  );
  getIt.registerLazySingleton<RemoveFromCartUseCase>(
    () => RemoveFromCartUseCase(getIt()),
  );
  getIt.registerLazySingleton<ClearCartUseCase>(
    () => ClearCartUseCase(getIt()),
  );

  // Wishlist UseCases
  getIt.registerLazySingleton<GetWishlistUseCase>(
    () => GetWishlistUseCase(getIt()),
  );
  getIt.registerLazySingleton<AddToWishlistUseCase>(
    () => AddToWishlistUseCase(getIt()),
  );
  getIt.registerLazySingleton<RemoveFromWishlistUseCase>(
    () => RemoveFromWishlistUseCase(getIt()),
  );

  // Addresses UseCases
  getIt.registerLazySingleton<GetAddressesUseCase>(
    () => GetAddressesUseCase(getIt()),
  );
  getIt.registerLazySingleton<AddAddressUseCase>(
    () => AddAddressUseCase(getIt()),
  );
  getIt.registerLazySingleton<RemoveAddressUseCase>(
    () => RemoveAddressUseCase(getIt()),
  );

  // Orders UseCases
  getIt.registerLazySingleton<CreateCashOrderUseCase>(
    () => CreateCashOrderUseCase(getIt()),
  );
  getIt.registerLazySingleton<CreateCheckoutSessionUseCase>(
    () => CreateCheckoutSessionUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetUserOrdersUseCase>(
    () => GetUserOrdersUseCase(getIt()),
  );

  //*---------------------------------- Services -------------------------------------*
  getIt.registerLazySingleton<CountryService>(() => CountryService());
  getIt.registerLazySingleton<PushNotificationService>(
    () => PushNotificationService(),
  );

  //*----------------------------------- Cubits ---------------------------------------*
  getIt.registerFactory<BottomNavBarCubit>(() => BottomNavBarCubit());
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<SearchCubit>(() => SearchCubit(getIt()));
  getIt.registerLazySingleton<cart_logic.CartCubit>(
    () => cart_logic.CartCubit(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit(getIt()));
  getIt.registerLazySingleton<WishlistCubit>(
    () => WishlistCubit(getIt(), getIt(), getIt(), getIt(), getIt()),
  );
  getIt.registerFactory<AddressesCubit>(
    () => AddressesCubit(getIt(), getIt(), getIt()),
  );
  getIt.registerLazySingleton<OrdersCubit>(
    () => OrdersCubit(getIt(), getIt(), getIt()),
  );
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt(), getIt()),
  );
  getIt.registerLazySingleton<NotificationsCubit>(
    () => NotificationsCubit(getIt()),
  );
  getIt.registerLazySingleton<ReviewsCubit>(() => ReviewsCubit());
}

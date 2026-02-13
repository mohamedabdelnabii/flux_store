import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'package:flux_store/features/cart/data/models/cart_item_model.dart';
import 'package:flux_store/features/categories/data/models/category_response.dart';
import 'package:flux_store/features/home/data/models/home_response.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flux_store/features/home/data/models/notification_model.dart';
import 'package:flux_store/features/orders/data/models/order_response.dart';
import 'package:flux_store/features/cart/data/models/cart_response.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:flux_store/features/products/data/models/review_model.dart';
import 'package:flux_store/features/settings/data/models/payment_card_model.dart';

Future<void> initializeHiveServices() async {
  await Hive.initFlutter();

  // Register Adapters
  // Register Adapters
  if (!Hive.isAdapterRegistered(10)) {
    Hive.registerAdapter(NotificationModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(ProductModelAdapter());
  }
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(SubcategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(5)) {
    Hive.registerAdapter(CategoryModelInProductAdapter());
  }
  if (!Hive.isAdapterRegistered(6)) {
    Hive.registerAdapter(BrandModelInProductAdapter());
  }
  if (!Hive.isAdapterRegistered(7)) {
    Hive.registerAdapter(CartItemModelAdapter());
  }
  if (!Hive.isAdapterRegistered(8)) {
    Hive.registerAdapter(AddressModelAdapter());
  }
  if (!Hive.isAdapterRegistered(9)) {
    Hive.registerAdapter(HomeResponseAdapter());
  }
  if (!Hive.isAdapterRegistered(11)) {
    Hive.registerAdapter(OrdersResponseAdapter());
  }
  if (!Hive.isAdapterRegistered(12)) {
    Hive.registerAdapter(OrderModelAdapter());
  }
  if (!Hive.isAdapterRegistered(13)) {
    Hive.registerAdapter(ShippingAddressAdapter());
  }
  if (!Hive.isAdapterRegistered(14)) {
    Hive.registerAdapter(UserInOrderAdapter());
  }
  if (!Hive.isAdapterRegistered(15)) {
    Hive.registerAdapter(CartProductItemAdapter());
  }
  if (!Hive.isAdapterRegistered(16)) {
    Hive.registerAdapter(CartProductDetailsAdapter());
  }
  if (!Hive.isAdapterRegistered(17)) {
    Hive.registerAdapter(SubCategoryInCartAdapter());
  }
  if (!Hive.isAdapterRegistered(18)) {
    Hive.registerAdapter(CategoryInCartAdapter());
  }
  if (!Hive.isAdapterRegistered(19)) {
    Hive.registerAdapter(BrandInCartAdapter());
  }
  if (!Hive.isAdapterRegistered(50)) {
    Hive.registerAdapter(ReviewModelAdapter());
  }
  if (!Hive.isAdapterRegistered(100)) {
    Hive.registerAdapter(PaymentCardModelAdapter());
  }

  // Open Boxes
  await Hive.openBox<NotificationModel>('notifications_box');
  await Hive.openBox<HomeResponse>('home_box');
  await Hive.openBox<ProductModel>('wishlist_box');
  await Hive.openBox<CartItemModel>('cart_box');
  await Hive.openBox<AddressModel>('addresses_box');
  await Hive.openBox<OrderModel>('orders_box');
  await Hive.openBox<String>('search_history_box');
  await Hive.openBox<ReviewModel>('reviews_box');
  await Hive.openBox<PaymentCardModel>('payment_cards');
}

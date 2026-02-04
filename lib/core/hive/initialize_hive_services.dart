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

Future<void> initializeHiveServices() async {
  await Hive.initFlutter();

  // Register Adapters
  Hive.registerAdapter(NotificationModelAdapter()); // id: 10
  Hive.registerAdapter(CategoryModelAdapter()); // id: 1
  Hive.registerAdapter(ProductModelAdapter()); // id: 2
  Hive.registerAdapter(SubcategoryModelAdapter()); // id: 4
  Hive.registerAdapter(CategoryModelInProductAdapter()); // id: 5
  Hive.registerAdapter(BrandModelInProductAdapter()); // id: 6
  Hive.registerAdapter(CartItemModelAdapter()); // id: 7
  Hive.registerAdapter(AddressModelAdapter()); // id: 8
  Hive.registerAdapter(HomeResponseAdapter()); // id: 9
  Hive.registerAdapter(OrdersResponseAdapter()); // id: 11
  Hive.registerAdapter(OrderModelAdapter()); // id: 12
  Hive.registerAdapter(ShippingAddressAdapter()); // id: 13
  Hive.registerAdapter(UserInOrderAdapter()); // id: 14
  Hive.registerAdapter(CartProductItemAdapter()); // id: 15
  Hive.registerAdapter(CartProductDetailsAdapter()); // id: 16
  Hive.registerAdapter(SubCategoryInCartAdapter()); // id: 17
  Hive.registerAdapter(CategoryInCartAdapter()); // id: 18
  Hive.registerAdapter(BrandInCartAdapter()); // id: 19
  Hive.registerAdapter(ReviewModelAdapter()); // id: 50

  // Open Boxes
  await Hive.openBox<NotificationModel>('notifications_box');
  await Hive.openBox<HomeResponse>('home_box');
  await Hive.openBox<ProductModel>('wishlist_box');
  await Hive.openBox<CartItemModel>('cart_box');
  await Hive.openBox<AddressModel>('addresses_box');
  await Hive.openBox<OrderModel>('orders_box');
  await Hive.openBox<String>('search_history_box');
  await Hive.openBox<ReviewModel>('reviews_box');
}

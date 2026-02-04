import 'package:flux_store/core/routes/routes_import.dart';
import 'package:go_router/go_router.dart';

class NotificationLogicHelper {
  static void handleNotificationNavigation(
    GoRouter router,
    Map<String, dynamic> data,
  ) {
    final String? type = data['type']?.toString();
    final String? id = data['id']?.toString();

    switch (type) {
      case 'order':
        if (id != null) {
          router.push(OrderDetailView.routeName, extra: id);
        }
        break;
      case 'product':
        if (id != null) {
          router.push(ProductDetailsView.routeName, extra: id);
        }
        break;
      case 'offer':
        router.push(VoucherView.routeName);
        break;
      default:
        router.push(NotificationsView.routeName);
        break;
    }
  }
}

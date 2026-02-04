import 'package:flux_store/features/orders/data/models/checkout_session_response.dart';
import 'package:flux_store/features/orders/data/models/order_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = Loading;
  const factory OrdersState.cashOrderSuccess(OrderModel order) =
      CashOrderSuccess;
  const factory OrdersState.checkoutSessionSuccess(
    CheckoutSessionResponse response,
  ) = CheckoutSessionSuccess;
  const factory OrdersState.ordersSuccess(OrdersResponse ordersResponse) =
      OrdersSuccess;
  const factory OrdersState.error({required String error}) = Error;
}

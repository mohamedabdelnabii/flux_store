import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/orders/data/models/order_response.dart';
import 'package:flux_store/features/orders/domain/usecases/order_use_cases.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final CreateCashOrderUseCase _createCashOrderUseCase;
  final CreateCheckoutSessionUseCase _createCheckoutSessionUseCase;
  final GetUserOrdersUseCase _getUserOrdersUseCase;

  OrdersCubit(
    this._createCashOrderUseCase,
    this._createCheckoutSessionUseCase,
    this._getUserOrdersUseCase,
  ) : super(const OrdersState.initial());

  Future<void> createCashOrder(
    String cartId,
    ShippingAddress shippingAddress,
  ) async {
    if (!isClosed) emit(const OrdersState.loading());
    final response = await _createCashOrderUseCase(cartId, shippingAddress);
    response.when(
      success: (order) {
        if (!isClosed) emit(OrdersState.cashOrderSuccess(order));
      },
      failure: (error) {
        if (!isClosed) emit(OrdersState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> createCheckoutSession(
    String cartId,
    String successUrl,
    ShippingAddress shippingAddress,
  ) async {
    if (!isClosed) emit(const OrdersState.loading());
    final response = await _createCheckoutSessionUseCase(
      cartId,
      successUrl,
      shippingAddress,
    );
    response.when(
      success: (checkoutResponse) {
        if (!isClosed) {
          emit(OrdersState.checkoutSessionSuccess(checkoutResponse));
        }
      },
      failure: (error) {
        if (!isClosed) emit(OrdersState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> getUserOrders() async {
    if (!isClosed) emit(const OrdersState.loading());
    final response = await _getUserOrdersUseCase();
    response.when(
      success: (ordersResponse) {
        if (!isClosed) emit(OrdersState.ordersSuccess(ordersResponse));
      },
      failure: (error) {
        if (!isClosed) emit(OrdersState.error(error: error.message ?? ""));
      },
    );
  }
}

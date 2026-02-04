// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrdersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel order) cashOrderSuccess,
    required TResult Function(CheckoutSessionResponse response)
        checkoutSessionSuccess,
    required TResult Function(OrdersResponse ordersResponse) ordersSuccess,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel order)? cashOrderSuccess,
    TResult? Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult? Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel order)? cashOrderSuccess,
    TResult Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CashOrderSuccess value) cashOrderSuccess,
    required TResult Function(CheckoutSessionSuccess value)
        checkoutSessionSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult? Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersStateCopyWith<$Res> {
  factory $OrdersStateCopyWith(
          OrdersState value, $Res Function(OrdersState) then) =
      _$OrdersStateCopyWithImpl<$Res, OrdersState>;
}

/// @nodoc
class _$OrdersStateCopyWithImpl<$Res, $Val extends OrdersState>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'OrdersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel order) cashOrderSuccess,
    required TResult Function(CheckoutSessionResponse response)
        checkoutSessionSuccess,
    required TResult Function(OrdersResponse ordersResponse) ordersSuccess,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel order)? cashOrderSuccess,
    TResult? Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult? Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel order)? cashOrderSuccess,
    TResult Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CashOrderSuccess value) cashOrderSuccess,
    required TResult Function(CheckoutSessionSuccess value)
        checkoutSessionSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult? Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OrdersState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'OrdersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel order) cashOrderSuccess,
    required TResult Function(CheckoutSessionResponse response)
        checkoutSessionSuccess,
    required TResult Function(OrdersResponse ordersResponse) ordersSuccess,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel order)? cashOrderSuccess,
    TResult? Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult? Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel order)? cashOrderSuccess,
    TResult Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CashOrderSuccess value) cashOrderSuccess,
    required TResult Function(CheckoutSessionSuccess value)
        checkoutSessionSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult? Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements OrdersState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$CashOrderSuccessImplCopyWith<$Res> {
  factory _$$CashOrderSuccessImplCopyWith(_$CashOrderSuccessImpl value,
          $Res Function(_$CashOrderSuccessImpl) then) =
      __$$CashOrderSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderModel order});
}

/// @nodoc
class __$$CashOrderSuccessImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$CashOrderSuccessImpl>
    implements _$$CashOrderSuccessImplCopyWith<$Res> {
  __$$CashOrderSuccessImplCopyWithImpl(_$CashOrderSuccessImpl _value,
      $Res Function(_$CashOrderSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$CashOrderSuccessImpl(
      null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel,
    ));
  }
}

/// @nodoc

class _$CashOrderSuccessImpl implements CashOrderSuccess {
  const _$CashOrderSuccessImpl(this.order);

  @override
  final OrderModel order;

  @override
  String toString() {
    return 'OrdersState.cashOrderSuccess(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashOrderSuccessImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CashOrderSuccessImplCopyWith<_$CashOrderSuccessImpl> get copyWith =>
      __$$CashOrderSuccessImplCopyWithImpl<_$CashOrderSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel order) cashOrderSuccess,
    required TResult Function(CheckoutSessionResponse response)
        checkoutSessionSuccess,
    required TResult Function(OrdersResponse ordersResponse) ordersSuccess,
    required TResult Function(String error) error,
  }) {
    return cashOrderSuccess(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel order)? cashOrderSuccess,
    TResult? Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult? Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult? Function(String error)? error,
  }) {
    return cashOrderSuccess?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel order)? cashOrderSuccess,
    TResult Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (cashOrderSuccess != null) {
      return cashOrderSuccess(order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CashOrderSuccess value) cashOrderSuccess,
    required TResult Function(CheckoutSessionSuccess value)
        checkoutSessionSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(Error value) error,
  }) {
    return cashOrderSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult? Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(Error value)? error,
  }) {
    return cashOrderSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (cashOrderSuccess != null) {
      return cashOrderSuccess(this);
    }
    return orElse();
  }
}

abstract class CashOrderSuccess implements OrdersState {
  const factory CashOrderSuccess(final OrderModel order) =
      _$CashOrderSuccessImpl;

  OrderModel get order;
  @JsonKey(ignore: true)
  _$$CashOrderSuccessImplCopyWith<_$CashOrderSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutSessionSuccessImplCopyWith<$Res> {
  factory _$$CheckoutSessionSuccessImplCopyWith(
          _$CheckoutSessionSuccessImpl value,
          $Res Function(_$CheckoutSessionSuccessImpl) then) =
      __$$CheckoutSessionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckoutSessionResponse response});
}

/// @nodoc
class __$$CheckoutSessionSuccessImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$CheckoutSessionSuccessImpl>
    implements _$$CheckoutSessionSuccessImplCopyWith<$Res> {
  __$$CheckoutSessionSuccessImplCopyWithImpl(
      _$CheckoutSessionSuccessImpl _value,
      $Res Function(_$CheckoutSessionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$CheckoutSessionSuccessImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as CheckoutSessionResponse,
    ));
  }
}

/// @nodoc

class _$CheckoutSessionSuccessImpl implements CheckoutSessionSuccess {
  const _$CheckoutSessionSuccessImpl(this.response);

  @override
  final CheckoutSessionResponse response;

  @override
  String toString() {
    return 'OrdersState.checkoutSessionSuccess(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutSessionSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutSessionSuccessImplCopyWith<_$CheckoutSessionSuccessImpl>
      get copyWith => __$$CheckoutSessionSuccessImplCopyWithImpl<
          _$CheckoutSessionSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel order) cashOrderSuccess,
    required TResult Function(CheckoutSessionResponse response)
        checkoutSessionSuccess,
    required TResult Function(OrdersResponse ordersResponse) ordersSuccess,
    required TResult Function(String error) error,
  }) {
    return checkoutSessionSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel order)? cashOrderSuccess,
    TResult? Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult? Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult? Function(String error)? error,
  }) {
    return checkoutSessionSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel order)? cashOrderSuccess,
    TResult Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (checkoutSessionSuccess != null) {
      return checkoutSessionSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CashOrderSuccess value) cashOrderSuccess,
    required TResult Function(CheckoutSessionSuccess value)
        checkoutSessionSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(Error value) error,
  }) {
    return checkoutSessionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult? Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(Error value)? error,
  }) {
    return checkoutSessionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (checkoutSessionSuccess != null) {
      return checkoutSessionSuccess(this);
    }
    return orElse();
  }
}

abstract class CheckoutSessionSuccess implements OrdersState {
  const factory CheckoutSessionSuccess(final CheckoutSessionResponse response) =
      _$CheckoutSessionSuccessImpl;

  CheckoutSessionResponse get response;
  @JsonKey(ignore: true)
  _$$CheckoutSessionSuccessImplCopyWith<_$CheckoutSessionSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrdersSuccessImplCopyWith<$Res> {
  factory _$$OrdersSuccessImplCopyWith(
          _$OrdersSuccessImpl value, $Res Function(_$OrdersSuccessImpl) then) =
      __$$OrdersSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrdersResponse ordersResponse});
}

/// @nodoc
class __$$OrdersSuccessImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$OrdersSuccessImpl>
    implements _$$OrdersSuccessImplCopyWith<$Res> {
  __$$OrdersSuccessImplCopyWithImpl(
      _$OrdersSuccessImpl _value, $Res Function(_$OrdersSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordersResponse = null,
  }) {
    return _then(_$OrdersSuccessImpl(
      null == ordersResponse
          ? _value.ordersResponse
          : ordersResponse // ignore: cast_nullable_to_non_nullable
              as OrdersResponse,
    ));
  }
}

/// @nodoc

class _$OrdersSuccessImpl implements OrdersSuccess {
  const _$OrdersSuccessImpl(this.ordersResponse);

  @override
  final OrdersResponse ordersResponse;

  @override
  String toString() {
    return 'OrdersState.ordersSuccess(ordersResponse: $ordersResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersSuccessImpl &&
            (identical(other.ordersResponse, ordersResponse) ||
                other.ordersResponse == ordersResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ordersResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersSuccessImplCopyWith<_$OrdersSuccessImpl> get copyWith =>
      __$$OrdersSuccessImplCopyWithImpl<_$OrdersSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel order) cashOrderSuccess,
    required TResult Function(CheckoutSessionResponse response)
        checkoutSessionSuccess,
    required TResult Function(OrdersResponse ordersResponse) ordersSuccess,
    required TResult Function(String error) error,
  }) {
    return ordersSuccess(ordersResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel order)? cashOrderSuccess,
    TResult? Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult? Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult? Function(String error)? error,
  }) {
    return ordersSuccess?.call(ordersResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel order)? cashOrderSuccess,
    TResult Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ordersSuccess != null) {
      return ordersSuccess(ordersResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CashOrderSuccess value) cashOrderSuccess,
    required TResult Function(CheckoutSessionSuccess value)
        checkoutSessionSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(Error value) error,
  }) {
    return ordersSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult? Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(Error value)? error,
  }) {
    return ordersSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (ordersSuccess != null) {
      return ordersSuccess(this);
    }
    return orElse();
  }
}

abstract class OrdersSuccess implements OrdersState {
  const factory OrdersSuccess(final OrdersResponse ordersResponse) =
      _$OrdersSuccessImpl;

  OrdersResponse get ordersResponse;
  @JsonKey(ignore: true)
  _$$OrdersSuccessImplCopyWith<_$OrdersSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'OrdersState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel order) cashOrderSuccess,
    required TResult Function(CheckoutSessionResponse response)
        checkoutSessionSuccess,
    required TResult Function(OrdersResponse ordersResponse) ordersSuccess,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel order)? cashOrderSuccess,
    TResult? Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult? Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel order)? cashOrderSuccess,
    TResult Function(CheckoutSessionResponse response)? checkoutSessionSuccess,
    TResult Function(OrdersResponse ordersResponse)? ordersSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CashOrderSuccess value) cashOrderSuccess,
    required TResult Function(CheckoutSessionSuccess value)
        checkoutSessionSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult? Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CashOrderSuccess value)? cashOrderSuccess,
    TResult Function(CheckoutSessionSuccess value)? checkoutSessionSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements OrdersState {
  const factory Error({required final String error}) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

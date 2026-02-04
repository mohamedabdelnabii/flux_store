// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserData userData) profileSuccess,
    required TResult Function(List<OrderModel> orders) ordersSuccess,
    required TResult Function(List<AddressModel> addresses) addressesSuccess,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserData userData)? profileSuccess,
    TResult? Function(List<OrderModel> orders)? ordersSuccess,
    TResult? Function(List<AddressModel> addresses)? addressesSuccess,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserData userData)? profileSuccess,
    TResult Function(List<OrderModel> orders)? ordersSuccess,
    TResult Function(List<AddressModel> addresses)? addressesSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(AddressesSuccess value) addressesSuccess,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(AddressesSuccess value)? addressesSuccess,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(AddressesSuccess value)? addressesSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

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
    extends _$SettingsStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'SettingsState.initial()';
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
    required TResult Function(UserData userData) profileSuccess,
    required TResult Function(List<OrderModel> orders) ordersSuccess,
    required TResult Function(List<AddressModel> addresses) addressesSuccess,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserData userData)? profileSuccess,
    TResult? Function(List<OrderModel> orders)? ordersSuccess,
    TResult? Function(List<AddressModel> addresses)? addressesSuccess,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserData userData)? profileSuccess,
    TResult Function(List<OrderModel> orders)? ordersSuccess,
    TResult Function(List<AddressModel> addresses)? addressesSuccess,
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
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(AddressesSuccess value) addressesSuccess,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(AddressesSuccess value)? addressesSuccess,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(AddressesSuccess value)? addressesSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SettingsState {
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
    extends _$SettingsStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'SettingsState.loading()';
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
    required TResult Function(UserData userData) profileSuccess,
    required TResult Function(List<OrderModel> orders) ordersSuccess,
    required TResult Function(List<AddressModel> addresses) addressesSuccess,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserData userData)? profileSuccess,
    TResult? Function(List<OrderModel> orders)? ordersSuccess,
    TResult? Function(List<AddressModel> addresses)? addressesSuccess,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserData userData)? profileSuccess,
    TResult Function(List<OrderModel> orders)? ordersSuccess,
    TResult Function(List<AddressModel> addresses)? addressesSuccess,
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
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(AddressesSuccess value) addressesSuccess,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(AddressesSuccess value)? addressesSuccess,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(AddressesSuccess value)? addressesSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SettingsState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ProfileSuccessImplCopyWith<$Res> {
  factory _$$ProfileSuccessImplCopyWith(_$ProfileSuccessImpl value,
          $Res Function(_$ProfileSuccessImpl) then) =
      __$$ProfileSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserData userData});
}

/// @nodoc
class __$$ProfileSuccessImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$ProfileSuccessImpl>
    implements _$$ProfileSuccessImplCopyWith<$Res> {
  __$$ProfileSuccessImplCopyWithImpl(
      _$ProfileSuccessImpl _value, $Res Function(_$ProfileSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = null,
  }) {
    return _then(_$ProfileSuccessImpl(
      null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData,
    ));
  }
}

/// @nodoc

class _$ProfileSuccessImpl implements ProfileSuccess {
  const _$ProfileSuccessImpl(this.userData);

  @override
  final UserData userData;

  @override
  String toString() {
    return 'SettingsState.profileSuccess(userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSuccessImpl &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSuccessImplCopyWith<_$ProfileSuccessImpl> get copyWith =>
      __$$ProfileSuccessImplCopyWithImpl<_$ProfileSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserData userData) profileSuccess,
    required TResult Function(List<OrderModel> orders) ordersSuccess,
    required TResult Function(List<AddressModel> addresses) addressesSuccess,
    required TResult Function(String error) error,
  }) {
    return profileSuccess(userData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserData userData)? profileSuccess,
    TResult? Function(List<OrderModel> orders)? ordersSuccess,
    TResult? Function(List<AddressModel> addresses)? addressesSuccess,
    TResult? Function(String error)? error,
  }) {
    return profileSuccess?.call(userData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserData userData)? profileSuccess,
    TResult Function(List<OrderModel> orders)? ordersSuccess,
    TResult Function(List<AddressModel> addresses)? addressesSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (profileSuccess != null) {
      return profileSuccess(userData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(AddressesSuccess value) addressesSuccess,
    required TResult Function(Error value) error,
  }) {
    return profileSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(AddressesSuccess value)? addressesSuccess,
    TResult? Function(Error value)? error,
  }) {
    return profileSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(AddressesSuccess value)? addressesSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (profileSuccess != null) {
      return profileSuccess(this);
    }
    return orElse();
  }
}

abstract class ProfileSuccess implements SettingsState {
  const factory ProfileSuccess(final UserData userData) = _$ProfileSuccessImpl;

  UserData get userData;
  @JsonKey(ignore: true)
  _$$ProfileSuccessImplCopyWith<_$ProfileSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrdersSuccessImplCopyWith<$Res> {
  factory _$$OrdersSuccessImplCopyWith(
          _$OrdersSuccessImpl value, $Res Function(_$OrdersSuccessImpl) then) =
      __$$OrdersSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrderModel> orders});
}

/// @nodoc
class __$$OrdersSuccessImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$OrdersSuccessImpl>
    implements _$$OrdersSuccessImplCopyWith<$Res> {
  __$$OrdersSuccessImplCopyWithImpl(
      _$OrdersSuccessImpl _value, $Res Function(_$OrdersSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_$OrdersSuccessImpl(
      null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
    ));
  }
}

/// @nodoc

class _$OrdersSuccessImpl implements OrdersSuccess {
  const _$OrdersSuccessImpl(final List<OrderModel> orders) : _orders = orders;

  final List<OrderModel> _orders;
  @override
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'SettingsState.ordersSuccess(orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersSuccessImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

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
    required TResult Function(UserData userData) profileSuccess,
    required TResult Function(List<OrderModel> orders) ordersSuccess,
    required TResult Function(List<AddressModel> addresses) addressesSuccess,
    required TResult Function(String error) error,
  }) {
    return ordersSuccess(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserData userData)? profileSuccess,
    TResult? Function(List<OrderModel> orders)? ordersSuccess,
    TResult? Function(List<AddressModel> addresses)? addressesSuccess,
    TResult? Function(String error)? error,
  }) {
    return ordersSuccess?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserData userData)? profileSuccess,
    TResult Function(List<OrderModel> orders)? ordersSuccess,
    TResult Function(List<AddressModel> addresses)? addressesSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ordersSuccess != null) {
      return ordersSuccess(orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(AddressesSuccess value) addressesSuccess,
    required TResult Function(Error value) error,
  }) {
    return ordersSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(AddressesSuccess value)? addressesSuccess,
    TResult? Function(Error value)? error,
  }) {
    return ordersSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(AddressesSuccess value)? addressesSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (ordersSuccess != null) {
      return ordersSuccess(this);
    }
    return orElse();
  }
}

abstract class OrdersSuccess implements SettingsState {
  const factory OrdersSuccess(final List<OrderModel> orders) =
      _$OrdersSuccessImpl;

  List<OrderModel> get orders;
  @JsonKey(ignore: true)
  _$$OrdersSuccessImplCopyWith<_$OrdersSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddressesSuccessImplCopyWith<$Res> {
  factory _$$AddressesSuccessImplCopyWith(_$AddressesSuccessImpl value,
          $Res Function(_$AddressesSuccessImpl) then) =
      __$$AddressesSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AddressModel> addresses});
}

/// @nodoc
class __$$AddressesSuccessImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$AddressesSuccessImpl>
    implements _$$AddressesSuccessImplCopyWith<$Res> {
  __$$AddressesSuccessImplCopyWithImpl(_$AddressesSuccessImpl _value,
      $Res Function(_$AddressesSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = null,
  }) {
    return _then(_$AddressesSuccessImpl(
      null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>,
    ));
  }
}

/// @nodoc

class _$AddressesSuccessImpl implements AddressesSuccess {
  const _$AddressesSuccessImpl(final List<AddressModel> addresses)
      : _addresses = addresses;

  final List<AddressModel> _addresses;
  @override
  List<AddressModel> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  String toString() {
    return 'SettingsState.addressesSuccess(addresses: $addresses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressesSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_addresses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressesSuccessImplCopyWith<_$AddressesSuccessImpl> get copyWith =>
      __$$AddressesSuccessImplCopyWithImpl<_$AddressesSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserData userData) profileSuccess,
    required TResult Function(List<OrderModel> orders) ordersSuccess,
    required TResult Function(List<AddressModel> addresses) addressesSuccess,
    required TResult Function(String error) error,
  }) {
    return addressesSuccess(addresses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserData userData)? profileSuccess,
    TResult? Function(List<OrderModel> orders)? ordersSuccess,
    TResult? Function(List<AddressModel> addresses)? addressesSuccess,
    TResult? Function(String error)? error,
  }) {
    return addressesSuccess?.call(addresses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserData userData)? profileSuccess,
    TResult Function(List<OrderModel> orders)? ordersSuccess,
    TResult Function(List<AddressModel> addresses)? addressesSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (addressesSuccess != null) {
      return addressesSuccess(addresses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(AddressesSuccess value) addressesSuccess,
    required TResult Function(Error value) error,
  }) {
    return addressesSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(AddressesSuccess value)? addressesSuccess,
    TResult? Function(Error value)? error,
  }) {
    return addressesSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(AddressesSuccess value)? addressesSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (addressesSuccess != null) {
      return addressesSuccess(this);
    }
    return orElse();
  }
}

abstract class AddressesSuccess implements SettingsState {
  const factory AddressesSuccess(final List<AddressModel> addresses) =
      _$AddressesSuccessImpl;

  List<AddressModel> get addresses;
  @JsonKey(ignore: true)
  _$$AddressesSuccessImplCopyWith<_$AddressesSuccessImpl> get copyWith =>
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
    extends _$SettingsStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'SettingsState.error(error: $error)';
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
    required TResult Function(UserData userData) profileSuccess,
    required TResult Function(List<OrderModel> orders) ordersSuccess,
    required TResult Function(List<AddressModel> addresses) addressesSuccess,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserData userData)? profileSuccess,
    TResult? Function(List<OrderModel> orders)? ordersSuccess,
    TResult? Function(List<AddressModel> addresses)? addressesSuccess,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserData userData)? profileSuccess,
    TResult Function(List<OrderModel> orders)? ordersSuccess,
    TResult Function(List<AddressModel> addresses)? addressesSuccess,
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
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(OrdersSuccess value) ordersSuccess,
    required TResult Function(AddressesSuccess value) addressesSuccess,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(OrdersSuccess value)? ordersSuccess,
    TResult? Function(AddressesSuccess value)? addressesSuccess,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(OrdersSuccess value)? ordersSuccess,
    TResult Function(AddressesSuccess value)? addressesSuccess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements SettingsState {
  const factory Error({required final String error}) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

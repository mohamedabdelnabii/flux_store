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
  bool get isProfileLoading => throw _privateConstructorUsedError;
  bool get isOrdersLoading => throw _privateConstructorUsedError;
  bool get isAddressesLoading => throw _privateConstructorUsedError;
  bool get isCardsLoading => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;
  List<OrderModel>? get orders => throw _privateConstructorUsedError;
  List<AddressModel>? get addresses => throw _privateConstructorUsedError;
  List<PaymentCardModel>? get cards => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call(
      {bool isProfileLoading,
      bool isOrdersLoading,
      bool isAddressesLoading,
      bool isCardsLoading,
      UserData? userData,
      List<OrderModel>? orders,
      List<AddressModel>? addresses,
      List<PaymentCardModel>? cards,
      String? error});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProfileLoading = null,
    Object? isOrdersLoading = null,
    Object? isAddressesLoading = null,
    Object? isCardsLoading = null,
    Object? userData = freezed,
    Object? orders = freezed,
    Object? addresses = freezed,
    Object? cards = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isProfileLoading: null == isProfileLoading
          ? _value.isProfileLoading
          : isProfileLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrdersLoading: null == isOrdersLoading
          ? _value.isOrdersLoading
          : isOrdersLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddressesLoading: null == isAddressesLoading
          ? _value.isAddressesLoading
          : isAddressesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCardsLoading: null == isCardsLoading
          ? _value.isCardsLoading
          : isCardsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
      addresses: freezed == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>?,
      cards: freezed == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<PaymentCardModel>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isProfileLoading,
      bool isOrdersLoading,
      bool isAddressesLoading,
      bool isCardsLoading,
      UserData? userData,
      List<OrderModel>? orders,
      List<AddressModel>? addresses,
      List<PaymentCardModel>? cards,
      String? error});
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProfileLoading = null,
    Object? isOrdersLoading = null,
    Object? isAddressesLoading = null,
    Object? isCardsLoading = null,
    Object? userData = freezed,
    Object? orders = freezed,
    Object? addresses = freezed,
    Object? cards = freezed,
    Object? error = freezed,
  }) {
    return _then(_$SettingsStateImpl(
      isProfileLoading: null == isProfileLoading
          ? _value.isProfileLoading
          : isProfileLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrdersLoading: null == isOrdersLoading
          ? _value.isOrdersLoading
          : isOrdersLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddressesLoading: null == isAddressesLoading
          ? _value.isAddressesLoading
          : isAddressesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCardsLoading: null == isCardsLoading
          ? _value.isCardsLoading
          : isCardsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      orders: freezed == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
      addresses: freezed == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>?,
      cards: freezed == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<PaymentCardModel>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl(
      {this.isProfileLoading = false,
      this.isOrdersLoading = false,
      this.isAddressesLoading = false,
      this.isCardsLoading = false,
      this.userData,
      final List<OrderModel>? orders,
      final List<AddressModel>? addresses,
      final List<PaymentCardModel>? cards,
      this.error})
      : _orders = orders,
        _addresses = addresses,
        _cards = cards;

  @override
  @JsonKey()
  final bool isProfileLoading;
  @override
  @JsonKey()
  final bool isOrdersLoading;
  @override
  @JsonKey()
  final bool isAddressesLoading;
  @override
  @JsonKey()
  final bool isCardsLoading;
  @override
  final UserData? userData;
  final List<OrderModel>? _orders;
  @override
  List<OrderModel>? get orders {
    final value = _orders;
    if (value == null) return null;
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AddressModel>? _addresses;
  @override
  List<AddressModel>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PaymentCardModel>? _cards;
  @override
  List<PaymentCardModel>? get cards {
    final value = _cards;
    if (value == null) return null;
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'SettingsState(isProfileLoading: $isProfileLoading, isOrdersLoading: $isOrdersLoading, isAddressesLoading: $isAddressesLoading, isCardsLoading: $isCardsLoading, userData: $userData, orders: $orders, addresses: $addresses, cards: $cards, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.isProfileLoading, isProfileLoading) ||
                other.isProfileLoading == isProfileLoading) &&
            (identical(other.isOrdersLoading, isOrdersLoading) ||
                other.isOrdersLoading == isOrdersLoading) &&
            (identical(other.isAddressesLoading, isAddressesLoading) ||
                other.isAddressesLoading == isAddressesLoading) &&
            (identical(other.isCardsLoading, isCardsLoading) ||
                other.isCardsLoading == isCardsLoading) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isProfileLoading,
      isOrdersLoading,
      isAddressesLoading,
      isCardsLoading,
      userData,
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_addresses),
      const DeepCollectionEquality().hash(_cards),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {final bool isProfileLoading,
      final bool isOrdersLoading,
      final bool isAddressesLoading,
      final bool isCardsLoading,
      final UserData? userData,
      final List<OrderModel>? orders,
      final List<AddressModel>? addresses,
      final List<PaymentCardModel>? cards,
      final String? error}) = _$SettingsStateImpl;

  @override
  bool get isProfileLoading;
  @override
  bool get isOrdersLoading;
  @override
  bool get isAddressesLoading;
  @override
  bool get isCardsLoading;
  @override
  UserData? get userData;
  @override
  List<OrderModel>? get orders;
  @override
  List<AddressModel>? get addresses;
  @override
  List<PaymentCardModel>? get cards;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

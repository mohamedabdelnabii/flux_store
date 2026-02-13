// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addresses_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressesState {
  bool get isLoading => throw _privateConstructorUsedError;
  AddressResponse? get addressResponse => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressesStateCopyWith<AddressesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressesStateCopyWith<$Res> {
  factory $AddressesStateCopyWith(
          AddressesState value, $Res Function(AddressesState) then) =
      _$AddressesStateCopyWithImpl<$Res, AddressesState>;
  @useResult
  $Res call({bool isLoading, AddressResponse? addressResponse, String? error});
}

/// @nodoc
class _$AddressesStateCopyWithImpl<$Res, $Val extends AddressesState>
    implements $AddressesStateCopyWith<$Res> {
  _$AddressesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? addressResponse = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      addressResponse: freezed == addressResponse
          ? _value.addressResponse
          : addressResponse // ignore: cast_nullable_to_non_nullable
              as AddressResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressesStateImplCopyWith<$Res>
    implements $AddressesStateCopyWith<$Res> {
  factory _$$AddressesStateImplCopyWith(_$AddressesStateImpl value,
          $Res Function(_$AddressesStateImpl) then) =
      __$$AddressesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, AddressResponse? addressResponse, String? error});
}

/// @nodoc
class __$$AddressesStateImplCopyWithImpl<$Res>
    extends _$AddressesStateCopyWithImpl<$Res, _$AddressesStateImpl>
    implements _$$AddressesStateImplCopyWith<$Res> {
  __$$AddressesStateImplCopyWithImpl(
      _$AddressesStateImpl _value, $Res Function(_$AddressesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? addressResponse = freezed,
    Object? error = freezed,
  }) {
    return _then(_$AddressesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      addressResponse: freezed == addressResponse
          ? _value.addressResponse
          : addressResponse // ignore: cast_nullable_to_non_nullable
              as AddressResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddressesStateImpl implements _AddressesState {
  const _$AddressesStateImpl(
      {this.isLoading = false, this.addressResponse, this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final AddressResponse? addressResponse;
  @override
  final String? error;

  @override
  String toString() {
    return 'AddressesState(isLoading: $isLoading, addressResponse: $addressResponse, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.addressResponse, addressResponse) ||
                other.addressResponse == addressResponse) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, addressResponse, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressesStateImplCopyWith<_$AddressesStateImpl> get copyWith =>
      __$$AddressesStateImplCopyWithImpl<_$AddressesStateImpl>(
          this, _$identity);
}

abstract class _AddressesState implements AddressesState {
  const factory _AddressesState(
      {final bool isLoading,
      final AddressResponse? addressResponse,
      final String? error}) = _$AddressesStateImpl;

  @override
  bool get isLoading;
  @override
  AddressResponse? get addressResponse;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$AddressesStateImplCopyWith<_$AddressesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

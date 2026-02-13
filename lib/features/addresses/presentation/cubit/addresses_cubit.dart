import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/addresses/domain/usecases/address_use_cases.dart';
import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  final GetAddressesUseCase _getAddressesUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final RemoveAddressUseCase _removeAddressUseCase;

  AddressesCubit(
    this._getAddressesUseCase,
    this._addAddressUseCase,
    this._removeAddressUseCase,
  ) : super(const AddressesState());

  Future<void> getAddresses() async {
    if (!isClosed) emit(state.copyWith(isLoading: true, error: null));
    final response = await _getAddressesUseCase();
    response.when(
      success: (addressResponse) {
        if (!isClosed) {
          emit(
            state.copyWith(isLoading: false, addressResponse: addressResponse),
          );
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(state.copyWith(isLoading: false, error: error.message ?? ""));
        }
      },
    );
  }

  Future<void> addAddress(
    String name,
    String details,
    String phone,
    String city,
  ) async {
    if (!isClosed) emit(state.copyWith(isLoading: true, error: null));
    final response = await _addAddressUseCase(
      AddressModel(name: name, details: details, phone: phone, city: city),
    );
    response.when(
      success: (_) => getAddresses(),
      failure: (error) {
        if (!isClosed) {
          emit(state.copyWith(isLoading: false, error: error.message ?? ""));
        }
      },
    );
  }

  Future<void> removeAddress(String addressId) async {
    if (!isClosed) emit(state.copyWith(isLoading: true, error: null));
    final response = await _removeAddressUseCase(addressId);
    response.when(
      success: (_) => getAddresses(),
      failure: (error) {
        if (!isClosed) {
          emit(state.copyWith(isLoading: false, error: error.message ?? ""));
        }
      },
    );
  }
}

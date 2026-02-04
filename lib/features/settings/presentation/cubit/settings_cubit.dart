import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/settings/data/models/address_model.dart';
import 'package:flux_store/features/settings/data/models/order_model.dart';
import 'package:flux_store/features/settings/data/repos/settings_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo _settingsRepo;
  SettingsCubit(this._settingsRepo) : super(const SettingsState.initial());

  Future<void> getProfile() async {
    if (!isClosed) emit(const SettingsState.loading());
    final response = await _settingsRepo.getProfile();
    response.when(
      success: (authResponse) {
        if (authResponse.user != null) {
          if (!isClosed) emit(SettingsState.profileSuccess(authResponse.user!));
        } else {
          if (!isClosed) {
            emit(const SettingsState.error(error: "User data not available"));
          }
        }
      },
      failure: (error) {
        if (!isClosed) emit(SettingsState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> getOrders() async {
    if (!isClosed) emit(const SettingsState.loading());
    final response = await _settingsRepo.getOrders();
    response.when(
      success: (orders) {
        if (!isClosed) emit(SettingsState.ordersSuccess(orders));
      },
      failure: (error) {
        if (!isClosed) emit(SettingsState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> getAddresses() async {
    if (!isClosed) emit(const SettingsState.loading());
    final response = await _settingsRepo.getAddresses();
    response.when(
      success: (addresses) {
        if (!isClosed) emit(SettingsState.addressesSuccess(addresses));
      },
      failure: (error) {
        if (!isClosed) emit(SettingsState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> addAddress(AddressModel address) async {
    if (!isClosed) emit(const SettingsState.loading());
    final response = await _settingsRepo.addAddress(address);
    response.when(
      success: (_) {
        getAddresses();
      },
      failure: (error) {
        if (!isClosed) emit(SettingsState.error(error: error.message ?? ""));
      },
    );
  }
}

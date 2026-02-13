import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/settings/data/models/address_model.dart';
import 'package:flux_store/features/settings/data/models/payment_card_model.dart';
import 'package:flux_store/features/settings/data/models/order_model.dart';
import 'package:flux_store/features/settings/data/repos/settings_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo _settingsRepo;
  SettingsCubit(this._settingsRepo) : super(const SettingsState());

  Future<void> getProfile() async {
    if (!isClosed) {
      emit(state.copyWith(isProfileLoading: true, error: null));
    }
    final response = await _settingsRepo.getProfile();
    response.when(
      success: (authResponse) {
        if (authResponse.user != null) {
          if (!isClosed) {
            emit(
              state.copyWith(
                isProfileLoading: false,
                userData: authResponse.user!,
              ),
            );
          }
        } else {
          if (!isClosed) {
            emit(
              state.copyWith(
                isProfileLoading: false,
                error: "User data not available",
              ),
            );
          }
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            state.copyWith(isProfileLoading: false, error: error.message ?? ""),
          );
        }
      },
    );
  }

  Future<void> getOrders() async {
    if (!isClosed) emit(state.copyWith(isOrdersLoading: true, error: null));
    final response = await _settingsRepo.getOrders();
    response.when(
      success: (orders) {
        if (!isClosed) {
          emit(state.copyWith(isOrdersLoading: false, orders: orders));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            state.copyWith(isOrdersLoading: false, error: error.message ?? ""),
          );
        }
      },
    );
  }

  Future<void> getAddresses() async {
    if (!isClosed) emit(state.copyWith(isAddressesLoading: true, error: null));
    final response = await _settingsRepo.getAddresses();
    response.when(
      success: (addresses) {
        if (!isClosed) {
          emit(state.copyWith(isAddressesLoading: false, addresses: addresses));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            state.copyWith(
              isAddressesLoading: false,
              error: error.message ?? "",
            ),
          );
        }
      },
    );
  }

  Future<void> addAddress(AddressModel address) async {
    if (!isClosed) emit(state.copyWith(isAddressesLoading: true, error: null));
    final response = await _settingsRepo.addAddress(address);
    response.when(
      success: (_) {
        getAddresses();
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            state.copyWith(
              isAddressesLoading: false,
              error: error.message ?? "",
            ),
          );
        }
      },
    );
  }

  Future<void> getCards() async {
    if (!isClosed) emit(state.copyWith(isCardsLoading: true, error: null));
    final response = await _settingsRepo.getCards();
    response.when(
      success: (cards) {
        if (!isClosed) {
          emit(state.copyWith(isCardsLoading: false, cards: cards));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            state.copyWith(isCardsLoading: false, error: error.message ?? ""),
          );
        }
      },
    );
  }

  Future<void> addCard(PaymentCardModel card) async {
    if (!isClosed) emit(state.copyWith(isCardsLoading: true, error: null));
    final response = await _settingsRepo.addCard(card);
    response.when(
      success: (_) {
        getCards();
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            state.copyWith(isCardsLoading: false, error: error.message ?? ""),
          );
        }
      },
    );
  }
}

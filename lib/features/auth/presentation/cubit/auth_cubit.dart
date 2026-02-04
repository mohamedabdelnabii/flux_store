import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/auth/domain/usecases/login_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/signup_use_case.dart';
import 'package:flux_store/features/auth/data/models/login_request_body.dart';
import 'package:flux_store/features/auth/data/models/signup_request_body.dart';
import 'package:flux_store/features/auth/data/models/forgot_password_request_body.dart';
import 'package:flux_store/features/auth/data/models/verify_reset_code_request_body.dart';
import 'package:flux_store/features/auth/data/models/reset_password_request_body.dart';
import 'package:flux_store/features/auth/data/models/update_me_request_body.dart';
import 'package:flux_store/features/auth/data/models/change_password_request_body.dart';
import 'package:flux_store/features/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/verify_reset_code_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/update_me_use_case.dart';
import 'package:flux_store/features/auth/domain/usecases/change_password_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final SignupUseCase _signupUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final UpdateMeUseCase _updateMeUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;

  AuthCubit(
    this._loginUseCase,
    this._signupUseCase,
    this._forgotPasswordUseCase,
    this._verifyResetCodeUseCase,
    this._resetPasswordUseCase,
    this._updateMeUseCase,
    this._changePasswordUseCase,
  ) : super(const AuthState.initial());

  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(const AuthState.loading());
    final response = await _loginUseCase(loginRequestBody);
    response.when(
      success: (authResponse) {
        emit(AuthState.success(authResponse));
      },
      failure: (error) {
        emit(AuthState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> signup(SignupRequestBody signupRequestBody) async {
    emit(const AuthState.loading());
    final response = await _signupUseCase(signupRequestBody);
    response.when(
      success: (authResponse) {
        emit(AuthState.success(authResponse));
      },
      failure: (error) {
        emit(AuthState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> forgotPassword(
    ForgotPasswordRequestBody forgotPasswordRequestBody,
  ) async {
    emit(const AuthState.loading());
    final response = await _forgotPasswordUseCase(forgotPasswordRequestBody);
    response.when(
      success: (authResponse) {
        emit(AuthState.success(authResponse));
      },
      failure: (error) {
        emit(AuthState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> verifyResetCode(
    VerifyResetCodeRequestBody verifyResetCodeRequestBody,
  ) async {
    emit(const AuthState.loading());
    final response = await _verifyResetCodeUseCase(verifyResetCodeRequestBody);
    response.when(
      success: (authResponse) {
        emit(AuthState.success(authResponse));
      },
      failure: (error) {
        emit(AuthState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> resetPassword(
    ResetPasswordRequestBody resetPasswordRequestBody,
  ) async {
    emit(const AuthState.loading());
    final response = await _resetPasswordUseCase(resetPasswordRequestBody);
    response.when(
      success: (authResponse) {
        emit(AuthState.success(authResponse));
      },
      failure: (error) {
        emit(AuthState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> updateMe(UpdateMeRequestBody updateMeRequestBody) async {
    emit(const AuthState.loading());
    final response = await _updateMeUseCase(updateMeRequestBody);
    response.when(
      success: (authResponse) {
        emit(AuthState.success(authResponse));
      },
      failure: (error) {
        emit(AuthState.error(error: error.message ?? ""));
      },
    );
  }

  Future<void> changeMyPassword(
    ChangePasswordRequestBody changePasswordRequestBody,
  ) async {
    emit(const AuthState.loading());
    final response = await _changePasswordUseCase(changePasswordRequestBody);
    response.when(
      success: (authResponse) {
        emit(AuthState.success(authResponse));
      },
      failure: (error) {
        emit(AuthState.error(error: error.message ?? ""));
      },
    );
  }
}

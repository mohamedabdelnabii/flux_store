import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/apis/auth_api_service.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/auth/data/models/login_request_body.dart';
import 'package:flux_store/features/auth/data/models/signup_request_body.dart';
import 'package:flux_store/features/auth/data/models/forgot_password_request_body.dart';
import 'package:flux_store/features/auth/data/models/verify_reset_code_request_body.dart';
import 'package:flux_store/features/auth/data/models/reset_password_request_body.dart';
import 'package:flux_store/features/auth/data/models/update_me_request_body.dart';
import 'package:flux_store/features/auth/data/models/change_password_request_body.dart';
import 'package:flux_store/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<ApiResult<AuthResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _authApiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _authApiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> forgotPassword(
    ForgotPasswordRequestBody forgotPasswordRequestBody,
  ) async {
    try {
      final response = await _authApiService.forgotPassword(
        forgotPasswordRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> verifyResetCode(
    VerifyResetCodeRequestBody verifyResetCodeRequestBody,
  ) async {
    try {
      final response = await _authApiService.verifyResetCode(
        verifyResetCodeRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> resetPassword(
    ResetPasswordRequestBody resetPasswordRequestBody,
  ) async {
    try {
      final response = await _authApiService.resetPassword(
        resetPasswordRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> updateMe(
    UpdateMeRequestBody updateMeRequestBody,
  ) async {
    try {
      final response = await _authApiService.updateMe(updateMeRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> changeMyPassword(
    ChangePasswordRequestBody changePasswordRequestBody,
  ) async {
    try {
      final response = await _authApiService.changeMyPassword(
        changePasswordRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

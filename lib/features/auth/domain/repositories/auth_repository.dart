import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/auth/data/models/login_request_body.dart';
import 'package:flux_store/features/auth/data/models/signup_request_body.dart';
import 'package:flux_store/features/auth/data/models/forgot_password_request_body.dart';
import 'package:flux_store/features/auth/data/models/verify_reset_code_request_body.dart';
import 'package:flux_store/features/auth/data/models/reset_password_request_body.dart';
import 'package:flux_store/features/auth/data/models/update_me_request_body.dart';
import 'package:flux_store/features/auth/data/models/change_password_request_body.dart';

abstract class AuthRepository {
  Future<ApiResult<AuthResponse>> login(LoginRequestBody loginRequestBody);
  Future<ApiResult<AuthResponse>> signup(SignupRequestBody signupRequestBody);
  Future<ApiResult<AuthResponse>> forgotPassword(
    ForgotPasswordRequestBody forgotPasswordRequestBody,
  );
  Future<ApiResult<AuthResponse>> verifyResetCode(
    VerifyResetCodeRequestBody verifyResetCodeRequestBody,
  );
  Future<ApiResult<AuthResponse>> resetPassword(
    ResetPasswordRequestBody resetPasswordRequestBody,
  );
  Future<ApiResult<AuthResponse>> updateMe(
    UpdateMeRequestBody updateMeRequestBody,
  );
  Future<ApiResult<AuthResponse>> changeMyPassword(
    ChangePasswordRequestBody changePasswordRequestBody,
  );
}

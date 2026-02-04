import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/auth/data/models/login_request_body.dart';
import 'package:flux_store/features/auth/data/models/signup_request_body.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/auth/data/models/forgot_password_request_body.dart';
import 'package:flux_store/features/auth/data/models/verify_reset_code_request_body.dart';
import 'package:flux_store/features/auth/data/models/reset_password_request_body.dart';
import 'package:flux_store/features/auth/data/models/update_me_request_body.dart';
import 'package:flux_store/features/auth/data/models/change_password_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiConstants.signin)
  Future<AuthResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<AuthResponse> signup(@Body() SignupRequestBody signupRequestBody);

  @POST(ApiConstants.forgotPassword)
  Future<AuthResponse> forgotPassword(
    @Body() ForgotPasswordRequestBody forgotPasswordRequestBody,
  );

  @POST(ApiConstants.verifyResetCode)
  Future<AuthResponse> verifyResetCode(
    @Body() VerifyResetCodeRequestBody verifyResetCodeRequestBody,
  );

  @PUT(ApiConstants.resetPassword)
  Future<AuthResponse> resetPassword(
    @Body() ResetPasswordRequestBody resetPasswordRequestBody,
  );

  @PUT(ApiConstants.updateMe)
  Future<AuthResponse> updateMe(
    @Body() UpdateMeRequestBody updateMeRequestBody,
  );

  @PUT(ApiConstants.changeMyPassword)
  Future<AuthResponse> changeMyPassword(
    @Body() ChangePasswordRequestBody changePasswordRequestBody,
  );
}

import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/auth/data/models/forgot_password_request_body.dart';
import 'package:flux_store/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository _authRepository;

  ForgotPasswordUseCase(this._authRepository);

  Future<ApiResult<AuthResponse>> call(
    ForgotPasswordRequestBody forgotPasswordRequestBody,
  ) {
    return _authRepository.forgotPassword(forgotPasswordRequestBody);
  }
}

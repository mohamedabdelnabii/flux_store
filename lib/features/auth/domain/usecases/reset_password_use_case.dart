import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/auth/data/models/reset_password_request_body.dart';
import 'package:flux_store/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository _authRepository;

  ResetPasswordUseCase(this._authRepository);

  Future<ApiResult<AuthResponse>> call(
    ResetPasswordRequestBody resetPasswordRequestBody,
  ) {
    return _authRepository.resetPassword(resetPasswordRequestBody);
  }
}

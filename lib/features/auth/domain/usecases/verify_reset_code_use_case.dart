import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/auth/data/models/verify_reset_code_request_body.dart';
import 'package:flux_store/features/auth/domain/repositories/auth_repository.dart';

class VerifyResetCodeUseCase {
  final AuthRepository _authRepository;

  VerifyResetCodeUseCase(this._authRepository);

  Future<ApiResult<AuthResponse>> call(
    VerifyResetCodeRequestBody verifyResetCodeRequestBody,
  ) {
    return _authRepository.verifyResetCode(verifyResetCodeRequestBody);
  }
}

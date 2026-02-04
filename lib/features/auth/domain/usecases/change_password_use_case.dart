import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/auth/data/models/change_password_request_body.dart';
import 'package:flux_store/features/auth/domain/repositories/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository _authRepository;

  ChangePasswordUseCase(this._authRepository);

  Future<ApiResult<AuthResponse>> call(
    ChangePasswordRequestBody changePasswordRequestBody,
  ) {
    return _authRepository.changeMyPassword(changePasswordRequestBody);
  }
}

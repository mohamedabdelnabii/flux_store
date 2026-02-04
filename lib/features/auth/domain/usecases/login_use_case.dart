import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/auth/data/models/login_request_body.dart';
import 'package:flux_store/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<ApiResult<AuthResponse>> call(LoginRequestBody loginRequestBody) {
    return _authRepository.login(loginRequestBody);
  }
}

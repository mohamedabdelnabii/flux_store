import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/auth/data/models/signup_request_body.dart';
import 'package:flux_store/features/auth/domain/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository _authRepository;

  SignupUseCase(this._authRepository);

  Future<ApiResult<AuthResponse>> call(SignupRequestBody signupRequestBody) {
    return _authRepository.signup(signupRequestBody);
  }
}

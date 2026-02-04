import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/auth/data/models/update_me_request_body.dart';
import 'package:flux_store/features/auth/domain/repositories/auth_repository.dart';

class UpdateMeUseCase {
  final AuthRepository _authRepository;

  UpdateMeUseCase(this._authRepository);

  Future<ApiResult<AuthResponse>> call(
    UpdateMeRequestBody updateMeRequestBody,
  ) {
    return _authRepository.updateMe(updateMeRequestBody);
  }
}

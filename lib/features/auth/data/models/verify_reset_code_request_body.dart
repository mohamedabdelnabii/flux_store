import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request_body.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestBody {
  final String resetCode;

  VerifyResetCodeRequestBody({required this.resetCode});

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestBodyToJson(this);
}

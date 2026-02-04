import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_body.g.dart';

@JsonSerializable()
class ChangePasswordRequestBody {
  final String currentPassword;
  final String password;
  final String rePassword;

  ChangePasswordRequestBody({
    required this.currentPassword,
    required this.password,
    required this.rePassword,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordRequestBodyToJson(this);
}

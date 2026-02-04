import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String? phone;

  SignupRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    this.phone,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}

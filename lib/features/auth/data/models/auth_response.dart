import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String? message;
  @JsonKey(name: 'data')
  final UserData? user;
  final String? token;

  AuthResponse({this.message, this.user, this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String? name;
  final String? email;
  final String? role;

  UserData({this.name, this.email, this.role});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

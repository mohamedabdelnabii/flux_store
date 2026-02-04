import 'package:json_annotation/json_annotation.dart';

part 'checkout_session_response.g.dart';

@JsonSerializable()
class CheckoutSessionResponse {
  final String? status;
  final SessionData? session;

  CheckoutSessionResponse({this.status, this.session});

  factory CheckoutSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutSessionResponseFromJson(json);
}

@JsonSerializable()
class SessionData {
  final String? url;
  final String? successUrl;
  final String? cancelUrl;

  SessionData({this.url, this.successUrl, this.cancelUrl});

  factory SessionData.fromJson(Map<String, dynamic> json) =>
      _$SessionDataFromJson(json);
}

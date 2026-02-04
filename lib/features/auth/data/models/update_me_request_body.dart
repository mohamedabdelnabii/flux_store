import 'package:json_annotation/json_annotation.dart';

part 'update_me_request_body.g.dart';

@JsonSerializable()
class UpdateMeRequestBody {
  final String? name;
  final String? email;
  final String? phone;

  UpdateMeRequestBody({this.name, this.email, this.phone});

  Map<String, dynamic> toJson() => _$UpdateMeRequestBodyToJson(this);
}

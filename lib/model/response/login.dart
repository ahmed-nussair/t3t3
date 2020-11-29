import 'package:json_annotation/json_annotation.dart';
import 'profile.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginResponse {
  bool result;
  Profile data;
  String message;

  LoginResponse(this.result, this.data, this.message);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String? phoneNumber;
  String? password;
  String? token;
  LoginRequest._({this.phoneNumber, this.password, this.token});
  factory LoginRequest.ByPassword(String phoneNumber, String password) {
    return LoginRequest._(phoneNumber: phoneNumber, password: password);
  }
  factory LoginRequest.ByToken(String token) {
    return LoginRequest._(token: token);
  }

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

import 'package:saigontour/models/customer.dart';
import 'package:saigontour/models/permission.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginResponse {
  String token;
  Customer customer;
  Permission permission;
  LoginResponse(this.token, this.customer, this.permission);

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

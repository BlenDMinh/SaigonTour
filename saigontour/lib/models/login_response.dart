import 'package:saigontour/models/customer.dart';
import 'package:saigontour/models/permission.dart';

class LoginResponse {
  String token;
  Customer customer;
  Permission permission;
  LoginResponse(this.token, this.customer, this.permission);
  factory LoginResponse.fromJson(Map json) {
    return LoginResponse(json["token"], json["customer"], json["permission"]);
  }
}

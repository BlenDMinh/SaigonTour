import 'package:saigontour/models/customer.dart';
import 'package:saigontour/models/permission.dart';

class LoginResponse {
  String token;
  Customer customer;
  Permission permission;
  LoginResponse(this.token, this.customer, this.permission);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(json["token"], Customer.fromJson(json["user"]),
        Permission.values.byName(json["permission"]));
  }

  Map<String, dynamic> toJson() => {
        "token": this.token,
        "customer": this.customer.toJson(),
        "permission": this.permission
      };
  @override
  String toString() {
    return toJson().toString();
  }
}

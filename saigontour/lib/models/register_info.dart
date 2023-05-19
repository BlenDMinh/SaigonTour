import 'customer.dart';

class RegisterInfo {
  Customer customer;
  String password;

  RegisterInfo(this.customer, this.password);

  Map<String, dynamic> toJson() {
    return {"customer": customer.toJson(), "password": password};
  }
}

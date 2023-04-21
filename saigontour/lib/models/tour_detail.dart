import 'package:saigontour/models/customer.dart';
import 'package:saigontour/models/user_type.dart';

class TourDetail {
  Customer tourCustomer;
  String vehicle;
  UserType userType;

  TourDetail(this.tourCustomer, this.vehicle, this.userType);

  factory TourDetail.fromJson(Map<String, dynamic> json) {
    return TourDetail(
        Customer.fromJson(json), json["vehicle"], json["userType"]);
  }
}

import 'package:saigontour/models/customer.dart';
import 'package:saigontour/models/tour_model.dart';
import 'package:saigontour/models/user_type.dart';

class TourDetail {
  TourModel? tourModel;
  Customer? tourCustomer;
  String vehicle;
  UserType userType;

  TourDetail(this.tourModel, this.tourCustomer, this.vehicle, this.userType);

  factory TourDetail.fromJson(Map<String, dynamic> json) {
    return TourDetail(
        TourModel.fromJson(json),
        Customer.fromJson(json), json["vehicle"], json["userType"]);
  }
}

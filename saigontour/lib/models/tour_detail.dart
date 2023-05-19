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
        TourModel.fromJson(json["tour"]),
        Customer.fromJson(json["tourUser"]),
        json["vehicle"],
        UserType.values.byName(json["userType"]));
  }

  Map<String, dynamic> toJson({int depth = 0}) {
    return {
      "tour": depth > 2 ? null : tourModel?.toJson(depth: depth + 1),
      "tourUser": depth > 2 ? null : tourCustomer?.toJson(depth: depth + 1),
      "vehicle": vehicle,
      "userType": userType
    };
  }
}

import 'dart:convert';
import 'dart:ffi';

import 'package:saigontour/models/payment_method.dart';
import 'package:saigontour/models/tour_detail.dart';
import 'package:saigontour/models/user_type.dart';

import 'customer.dart';

class TourModel {
  int? tourId;
  String? name;
  String? description;
  double? price;
  DateTime? startTime;
  List<String> tourPath;
  int? maxCustomer;
  List<TourDetail> tourDetails;

  TourModel(this.tourId, this.name, this.description, this.price,
      this.startTime, this.tourPath, this.maxCustomer, this.tourDetails);

  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel.fromJsonWithTourDetailsAndTourPath(
        json,
        json["tourDetails"] == null
            ? []
            : json["tourDetails"]
                .map<TourDetail>((j) => TourDetail.fromJson(j))
                .toList(),
        json["tourPath"] == null ? [] : json["tourPath"]);
  }

  factory TourModel.fromJsonWithTourDetailsAndTourPath(
      Map<String, dynamic> json,
      List<TourDetail> tourDetails,
      List<dynamic> tourPath) {
    return TourModel(
        json["tourId"],
        json["name"],
        json["description"],
        json["price"],
        json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
        tourPath.map<String>((e) => e).toList(),
        json["maxCustomerNumber"],
        tourDetails);
  }

  Map<String, dynamic> toJson({int depth = 0}) => {
        "tourId": tourId,
        "name": name,
        "description": description,
        "price": price,
        "startTime": startTime,
        "tourPath": tourPath,
        "maxCustomer": maxCustomer,
        "tourDetails": depth > 1
            ? []
            : tourDetails.map((e) => e.toJson(depth: depth + 1)).toList()
      };
  @override
  String toString() => toJson().toString();
}

List<String> tourPath = ['TP Hồ Chí Minh', 'Đà Nẵng'];
var a = TourDetail(
    null,
    Customer(1, 'charcuter', 10, '0123456789', {PaymentMethod.DEBIT_CARD}, []),
    'Bus',
    UserType.ADULT);

List<TourModel> tourModelList = [
  TourModel(1, 'Đà Nẵng', 'Summer time', 7000000, DateTime.utc(2023, 7, 26, 9, 30, 10),
      tourPath, 30, [a]),
  TourModel(
      2, 'Đà Lạt', 'Hot', 4000, DateTime.utc(2023, 18, 7), tourPath, 30, [a]),
  TourModel(2, 'TP Hồ Chí Minh', 'Fun', 2000, DateTime.utc(2023, 1, 6),
      tourPath, 30, [a])
];

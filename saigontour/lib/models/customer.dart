import 'dart:convert';

import 'package:saigontour/models/payment_method.dart';
import 'package:saigontour/models/tour_detail.dart';

class Customer {
  int? userId;
  String? fullname;
  int? age;
  String? phoneNumber;
  Set<PaymentMethod> paymentMethods;
  List<TourDetail> tourDetails;

  Customer(this.userId, this.fullname, this.age, this.phoneNumber,
      this.paymentMethods, this.tourDetails);
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer.fromJsonWithTourDetail(
        json,
        json["tourDetails"] == null
            ? []
            : List.of(json["tourDetails"])
                .map((j) => TourDetail.fromJson(j))
                .toList());
  }
  factory Customer.fromJsonWithTourDetail(
      Map<String, dynamic> json, List<TourDetail> tourDetails) {
    return Customer(
        json["userId"],
        json["fullname"],
        json["age"],
        json["phoneNumber"],
        json["paymentMethods"] == null
            ? new Set()
            : json["paymentMethods"]
                .map<PaymentMethod>((e) => PaymentMethod.values.byName(e))
                .toSet(),
        tourDetails);
  }
  Map<String, dynamic> toJson({int depth = 0}) => {
        "userId": userId,
        "fullname": fullname,
        "age": age,
        "phoneNumber": phoneNumber,
        "paymentMethods": paymentMethods.map((e) => e.toString()).toList(),
        "tourDetails": depth > 1
            ? []
            : tourDetails.map((e) => e.toJson(depth: depth + 1)).toList()
      };
  @override
  String toString() => toJson().toString();
}

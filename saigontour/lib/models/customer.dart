import 'package:saigontour/models/payment_method.dart';
import 'package:saigontour/models/tour_detail.dart';

class Customer { 
  int? userId;
  String fullname;
  int age;
  String phoneNumber;
  Set<PaymentMethod> paymentMethods;
  List<TourDetail> tourDetails;

  Customer(this.userId, this.fullname, this.age, this.phoneNumber,
      this.paymentMethods, this.tourDetails);
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer.fromJsonWithTourDetail(
        json,
        json["tourDetails"]
            .map<TourDetail>((j) => TourDetail.fromJson(j))
            .toList());
  }
  factory Customer.fromJsonWithTourDetail(
      Map<String, dynamic> json, List<TourDetail> tourDetails) {
    return Customer(
        json["userId"],
        json["fullname"],
        json["age"],
        json["phoneNumber"],
        json["paymentMethods"]
            .map<PaymentMethod>((e) => PaymentMethod.values[e])
            .toSet(),
        tourDetails);
  }
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullname": fullname,
        "age": age,
        "phoneNumber": phoneNumber,
        "paymentMethods": paymentMethods,
        "tourDetails": tourDetails
      };
  @override
  String toString() => toJson().toString();
}

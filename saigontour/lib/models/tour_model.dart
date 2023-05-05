import 'dart:ffi';

import 'package:saigontour/models/tour_detail.dart';

class TourModel {
  int tourId;
  String name;
  String description;
  Float price;
  DateTime startTime;
  List<String> tourPath;
  int maxCustomer;
  List<TourDetail> tourDetails;

  TourModel(this.tourId, this.name, this.description, this.price,
      this.startTime, this.tourPath, this.maxCustomer, this.tourDetails);

  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel.fromJsonWithTourDetailsAndTourPath(
        json,
        json["tourDetails"]
            .map<TourDetail>((j) => TourDetail.fromJson(j))
            .toList(),
        json["tourPath"]);
  }

  factory TourModel.fromJsonWithTourDetailsAndTourPath(
      Map<String, dynamic> json,
      List<TourDetail> tourDetails,
      List<String> tourPath) {
    return TourModel(
        json["tourId"],
        json["name"],
        json["description"],
        json["price"],
        json["startTime"],
        tourPath,
        json["maxCustomer"],
        tourDetails);
  }

  Map<String, dynamic> toJson() => {
        "tourId": tourId,
        "name": name,
        "description": description,
        "price": price,
        "startTime": startTime,
        "tourPath": tourPath,
        "maxCustomer": maxCustomer,
        "tourDetails": tourDetails
      };
  @override
  String toString() => toJson().toString();
}

import 'dart:convert';

import 'package:saigontour/models/tour_model.dart';
import 'package:saigontour/service/service_config.dart';
import 'package:http/http.dart' as http;

class TourService {
  final base_url = "api/tour";
  Future<List<TourModel>> getAll() async {
    var uri = Uri.http(ServiceConfig.api_url, base_url);
    return http.get(uri, headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    }).then((res) {
      var jsonObject = jsonDecode(res.body);
      var tours = <TourModel>[];
      for (var e in jsonObject) {
        tours.add(TourModel.fromJson(e));
      }
      return tours;
    });
  }

  Future<TourModel> getById(int id) async {
    var url = base_url + "/" + id.toString();
    var uri = Uri.http(ServiceConfig.api_url, url);
    return http.get(uri, headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    }).then((res) => TourModel.fromJson(jsonDecode(res.body)));
  }
}

void main(List<String> args) {
  var service = TourService();
  service.getById(1553).then((value) => print(value));
}

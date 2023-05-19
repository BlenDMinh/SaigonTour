import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saigontour/models/customer.dart';
import 'package:saigontour/models/login_request.dart';
import 'package:saigontour/models/login_response.dart';
import 'package:saigontour/models/register_info.dart';
import 'package:saigontour/service/service_config.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class CustomerService {
  static CustomerService _instance = CustomerService.__();

  CustomerService.__() {}

  factory CustomerService() {
    if (CustomerService._instance == null) _instance = CustomerService.__();
    return _instance;
  }

  Future<File> get _tokenFile async {
    return File((await getApplicationDocumentsDirectory()).path + "/token");
  }

  final base_url = "api/authen";

  Future<void> register(RegisterInfo registerInfo) async {
    var url = base_url + "/register";
    var uri = Uri.http(ServiceConfig.api_url, url);
    return http
        .post(uri,
            headers: {
              "Content-Type": "application/json; charset=utf-8",
              "Access-Control-Allow-Origin": "*",
              "Accept": "application/json; charset=utf-8",
              "Accept": "application/json; charset=utf-8"
            },
            body: jsonEncode(registerInfo.toJson()))
        .then((value) => null);
  }

  Future<LoginResponse> login({LoginRequest? request = null}) async {
    if (request == null) {
      var token = await _tokenFile;
      if (!token.existsSync()) {
        print("Token not found");
        return LoginResponse(null, null, null);
      }
      var tokenStr = token.readAsStringSync();
      request = LoginRequest.ByToken(tokenStr);
    }
    var url = base_url + "/login";
    var uri = Uri.http(ServiceConfig.api_url, url);
    print(jsonEncode(request.toJson()));
    return http
        .post(uri,
            headers: {
              "Content-Type": "application/json; charset=utf-8",
              "Access-Control-Allow-Origin": "*",
              "Accept": "application/json; charset=utf-8"
            },
            body: jsonEncode(request.toJson()))
        .then((res) {
      if (res.statusCode != HttpStatus.ok)
        return Future.error(Exception(
            "Status: " + res.statusCode.toString() + ". " + res.body));
      final loginResponse = LoginResponse.fromJson(jsonDecode(res.body));
      if (loginResponse.token == null) return loginResponse;
      this.loggedInCustomer = loginResponse.customer;
      // print(this.loggedInCustomer);
      _tokenFile.then((file) {
        file.exists().then((e) {
          if (!e)
            file.create(recursive: true).then((value) {
              value.writeAsString(loginResponse.token!);
            });
          else
            file.writeAsString(loginResponse.token!);
        });
      });
      return loginResponse;
    });
  }

  Future<void> logout() {
    if (loggedInCustomer == null) return Future.error("Not logged in");
    var url = base_url + "/logout";
    var uri = Uri.http(ServiceConfig.api_url, url);
    return http
        .post(uri,
            headers: {
              "Content-Type": "application/json; charset=utf-8",
              "Access-Control-Allow-Origin": "*",
              "Accept": "application/json; charset=utf-8"
            },
            body: loggedInCustomer!.userId.toString())
        .then((value) {
      loggedInCustomer = null;
    });
  }

  Future<void> update() {
    var uri = Uri.http(ServiceConfig.api_url, "/api/customer");
    log(jsonEncode(loggedInCustomer?.toJson()));
    // print();
    return http
        .put(uri,
            headers: {
              "Content-Type": "application/json; charset=utf-8",
              "Access-Control-Allow-Origin": "*",
              "Accept": "application/json; charset=utf-8"
            },
            body: jsonEncode(loggedInCustomer?.toJson()))
        .then((res) {
      if (res.statusCode != HttpStatus.ok)
        return Future.error(Exception(
            "Status: " + res.statusCode.toString() + ". " + res.body));
      Customer customer = Customer.fromJson(jsonDecode(res.body));
      loggedInCustomer = customer;
    });
  }

  Customer? loggedInCustomer = null;
}

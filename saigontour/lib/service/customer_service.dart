import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saigontour/models/customer.dart';
import 'package:saigontour/models/login_request.dart';
import 'package:saigontour/models/login_response.dart';
import 'package:saigontour/service/service_config.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  static CustomerService instance = CustomerService.__();

  CustomerService.__() {}

  factory CustomerService() {
    return CustomerService.__();
  }

  Future<File> get _tokenFile async {
    return File((await getApplicationDocumentsDirectory()).path + "/token");
  }

  final base_url = "api/authen";

  Future<LoginResponse> login({LoginRequest? request = null}) async {
    if (request == null) {
      var token = await _tokenFile;
      if(!token.existsSync())
        return Future.error(Exception("Login token not exist"));
      var tokenStr = token.readAsStringSync();
      request = LoginRequest.ByToken(tokenStr);
    }
    var url = base_url + "/login";
    var uri = Uri.http(ServiceConfig.api_url, url);
    print(jsonEncode(request.toJson()));
    return http
        .post(uri,
            headers: {
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*"
            },
            body: jsonEncode(request.toJson()))
        .then((res) {
          if (res.statusCode != HttpStatus.ok)
            return Future.error(Exception("Status: " + res.statusCode.toString() + ". " + res.body));
          final loginResponse = LoginResponse.fromJson(jsonDecode(res.body));
          if(loginResponse.token == null)
            return loginResponse;
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
          loggedInCustomer = loginResponse.customer;
          return loginResponse;
        }, onError: (e) {
          e.printError();
        });
  }

  Customer? loggedInCustomer = null;
}

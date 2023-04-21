import 'dart:convert';

import 'package:saigontour/models/login_request.dart';
import 'package:saigontour/models/login_response.dart';
import 'package:saigontour/service/service_config.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  final base_url = "api/authen";

  login(LoginRequest request) async {
    var url = base_url + "/login";
    var uri = Uri.http(ServiceConfig.api_url, url);
    print(uri);
    var response = await http.post(uri,
        headers: {"Content-Type": "application/json"},
        body: json.encode(request.toJson()));

    LoginResponse loginResponse =
        LoginResponse.fromJson(jsonDecode(response.body));
    print(loginResponse);
  }
}

void main(List<String> args) {
  AuthenticationService service = AuthenticationService();
  LoginRequest request = LoginRequest.ByPassword("0769639972", "ComTMM0112");
  service.login(request);
}

import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saigontour/models/login_request.dart';
import 'package:saigontour/models/login_response.dart';
import 'package:saigontour/service/service_config.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  Future<File> get _tokenFile async {
    return await File(
        (await getApplicationDocumentsDirectory()).path + "/token");
  }

  final base_url = "api/authen";

  Future<LoginResponse> login(LoginRequest request) async {
    // final token = await _tokenFile;
    var url = base_url + "/login";
    var uri = Uri.http(ServiceConfig.api_url, url);
    var response = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: json.encode(request.toJson()));
    LoginResponse loginResponse;
    if (response.statusCode == HttpStatus.ok)
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    else
      throw Exception();
    // token.writeAsString(loginResponse.token);
    return loginResponse;
  }
}

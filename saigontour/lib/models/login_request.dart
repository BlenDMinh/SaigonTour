class LoginRequest {
  String? phoneNumber;
  String? password;
  String? token;
  LoginRequest._({this.phoneNumber, this.password, this.token});
  factory LoginRequest.ByPassword(String phoneNumber, String password) {
    return LoginRequest._(phoneNumber: phoneNumber, password: password);
  }
  factory LoginRequest.ByToken(String token) {
    return LoginRequest._(token: token);
  }

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("token") && json["token"] != null)
      return LoginRequest.ByToken(json["token"]);
    return LoginRequest.ByPassword(json["phoneNumber"], json["password"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "token": this.token,
      "phoneNumber": this.phoneNumber,
      "password": this.password
    };
  }
}

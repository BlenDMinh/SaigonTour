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

  Map toJson() {
    if (phoneNumber != null)
      return {"phoneNumber": phoneNumber, "password": password};
    return {"token": token};
  }
}

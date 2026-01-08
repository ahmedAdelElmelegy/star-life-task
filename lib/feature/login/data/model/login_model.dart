class LoginModel {
  final String token;
  final String refreshToken;

  LoginModel({required this.token, required this.refreshToken});
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json['access_token'],
    refreshToken: json['refresh_token'],
  );
}

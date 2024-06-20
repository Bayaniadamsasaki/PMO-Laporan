import 'dart:convert';

class LoginResponseModel {
  final String accessToken;
  final String refreshToken;
  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('access_token') && map.containsKey('refresh_token')) {
      return LoginResponseModel(
        accessToken: map['access_token'] as String,
        refreshToken: map['refresh_token'] as String,
      );
    } else {
      throw const FormatException('Invalid response format for LoginResponseModel');
    }
  }

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

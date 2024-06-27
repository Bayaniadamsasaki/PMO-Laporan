// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginResponseModel {
  final String accessToken;
  final String refreshToken;
  final String role;
  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'role': role,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      throw FormatException('Null map provided to LoginResponseModel');
    }
    return LoginResponseModel(
      accessToken: map['access_token'] as String? ?? '',
      refreshToken: map['refresh_token'] as String? ?? '',
      role: map['role'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'package:http/http.dart' as http;
import 'package:laporan_masyarakat/localstorage/auth_local_storage.dart';
import 'package:laporan_masyarakat/model/response/login_response_model.dart';
import 'package:laporan_masyarakat/model/response/register_response_model.dart';
import 'package:laporan_masyarakat/model/reuqest/login_model.dart';

import '../../model/reuqest/register_model.dart';

class AuthDataSources {
  Future<RegisterResponseModel> register(RegisterModel registerModel) async {
    final response = await http.post(
      Uri.parse('http://10.138.34.112:8000/api/register'),
      headers: {'Content-Type': 'application/json'},
      body: registerModel.toMap(),
    );

    if (response.statusCode == 200) {
      print('Respons API: ${response.body}');
      return RegisterResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<LoginResponseModel> login(LoginModel loginModel) async {
    final response = await http.post(
      Uri.parse('http://10.138.34.112:8000/api/login'),
      body: loginModel.toMap(),
    );

    if (response.statusCode == 200) {
      print('Respons API: ${response.body}');
      return LoginResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> logout() async {
    try {
      final response = await http.post(
        Uri.parse('http://10.138.34.112:8000/api/logout'),
        headers: {
          'Authorization': 'Bearer ${await AuthLocalStorage().getToken()}'
        },
      );

      if (response.statusCode == 200) {
        print('Logout successful');
        await AuthManager.logout();
      } else {
        throw Exception('Failed to logout');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to logout');
    }
  }
}

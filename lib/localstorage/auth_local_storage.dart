import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
  final String tokenKey = 'token';

  Future<String> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(tokenKey, token);
    print('Token berhasil disimpan: $token');
    return tokenKey;
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString(tokenKey);
    print('Token diambil: $token');
    return token;
  }

  Future<bool> isTokenExist() async {
    final pref = await SharedPreferences.getInstance();
    final isExist = pref.getString(tokenKey) != null;
    print('Apakah token ada? $isExist');
    return isExist;
  }

  Future<bool> removeToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(tokenKey);
  }
}

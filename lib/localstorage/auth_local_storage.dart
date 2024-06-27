import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
  final String tokenKey = 'token';
  final String nameKey = 'name';

  Future<String> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(tokenKey, token);
    return token;
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(tokenKey);
  }

  Future<bool> isTokenExist() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(tokenKey) != null;
  }

  Future<bool> removeToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(tokenKey);
  }

  Future<void> saveName(String name) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(nameKey, name);
  }

  Future<String?> getName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(nameKey);
  }

  Future<void> clearToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(tokenKey);
  }
}

class AuthManager {
  static final AuthLocalStorage _localStorage = AuthLocalStorage();

  static Future<bool> isLoggedIn() async {
    return await _localStorage.isTokenExist();
  }

  static Future<void> login(String token) async {
    await _localStorage.saveToken(token);
  }

  static Future<void> logout() async {
    await _localStorage.removeToken();
  }
}

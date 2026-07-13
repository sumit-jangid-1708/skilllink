import 'package:get_storage/get_storage.dart';

class AppStorage {
  static final _storage = GetStorage();
  static const String _tokenKey = 'token';

  // Save Token
  static Future<void> saveToken(String token) async {
    await _storage.write(_tokenKey, token);
  }

  // Get Token
  static String? getToken() {
    return _storage.read(_tokenKey);
  }

  // Remove Token (Logout)
  static Future<void> removeToken() async {
    await _storage.remove(_tokenKey);
  }

  // Clear all storage
  static Future<void> clearAll() async {
    await _storage.erase();
  }
}

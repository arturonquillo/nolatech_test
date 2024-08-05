import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  /// Guarda un objeto de tipo String en localStorage.
  static Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  /// Recupera un objeto de tipo String desde localStorage.
  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  /// Elimina un objeto en localStorage.
  static Future<void> removeString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  /// Limpia todos los datos en localStorage.
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
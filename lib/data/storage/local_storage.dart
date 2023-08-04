
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _localStorage;

  factory LocalStorage() => LocalStorage._internal();

  LocalStorage._internal();

  init() async {
    _localStorage = await SharedPreferences.getInstance();
  }

  static saveLocalData(String key, dynamic data) {
    if (data is String) {
      _localStorage.setString(key, data);
    } else if (data is int) {
      _localStorage.setInt(key, data);
    } else if (data is double) {
      _localStorage.setDouble(key, data);
    } else if (data is bool) {
      _localStorage.setBool(key, data);
    } else if (data is List<String>) {
      _localStorage.setStringList(key, data);
    } else {
      throw Exception("Unsupported data type");
    }
  }

  static dynamic loadLocalData(String key, {dynamic defaultValue}) {
    return _localStorage.get(key) ?? defaultValue;
  }

  static removeLocalData(String key) {
    _localStorage.remove(key);
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreference;
  bool? isDark = CacheHelper.get(key: 'isDark');

  static init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  static dynamic get({
    @required key,
  }) {
    return sharedPreference?.get(key!);
  }

  static Future<bool?> saveData({
    @required String? key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreference?.setString(key!, value);
    }
    if (value is int) {
      return await sharedPreference?.setInt(key!, value);
    }
    if (value is bool) {
      return await sharedPreference?.setBool(key!, value);
    }
    if (value is List<String>) {
      return await sharedPreference?.setStringList(key!, value);
    }

    return await sharedPreference?.setDouble(key!, value);
  }

  static Future<bool?> removeData({required String key}) async {
    return await sharedPreference?.remove(key);
  }
}

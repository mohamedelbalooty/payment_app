import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheInfo {
  Future<bool> setStringData({required String key, required String value});

  String? getStringData({required String key});

  Future<bool> setBooleanData({required String key, required bool value});

  bool? getBooleanData({required String key});

  Future<bool> setIntData({required String key, required int value});

  int? getIntData({required String key});
}

class CacheInfoImplWithPreferences implements CacheInfo {
  final SharedPreferences preferences;

  CacheInfoImplWithPreferences({required this.preferences});

  @override
  Future<bool> setStringData(
      {required String key, required String value}) async {
    return await preferences.setString(key, value);
  }

  @override
  String? getStringData({required String key}) {
    return preferences.getString(key);
  }

  @override
  Future<bool> setBooleanData(
      {required String key, required bool value}) async {
    return await preferences.setBool(key, value);
  }

  @override
  bool? getBooleanData({required String key}) {
    return preferences.getBool(key);
  }

  @override
  Future<bool> setIntData({required String key, required int value}) async {
    return await preferences.setInt(key, value);
  }

  @override
  int? getIntData({required String key}) {
    return preferences.getInt(key);
  }
}

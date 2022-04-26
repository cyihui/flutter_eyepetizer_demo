import 'package:shared_preferences/shared_preferences.dart';

///本地缓存管理类
class CacheManager {


  static void set(String key, Object value) async {
    print("chache_manager==>set:key:$key,value:$value");
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is String) {
      _preferences.setString(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    } else {
      throw Exception("only Support int、String、double、bool、List<String>");
    }
  }
  static Future<int> getInteger(String key, [int defaultValue = 0]) async {
    var sp = await SharedPreferences.getInstance();
    var value = sp.getInt(key);
    return value ?? defaultValue;
  }

  static Future<String> getString(String key, [String defaultValue = '']) async {
    var sp = await SharedPreferences.getInstance();
    var value = sp.getString(key);
    return value ?? defaultValue;
  }

  static Future<bool> getBool(String key, [bool defaultValue = false]) async {
    var sp = await SharedPreferences.getInstance();
    var value = sp.getBool(key);
    return value ?? defaultValue;
  }

  static Future<double> getDouble(String key, [double defaultValue = 0.0]) async {
    var sp = await SharedPreferences.getInstance();
    var value = sp.getDouble(key);
    return value ?? defaultValue;
  }

  static Future<List<String>> getStringList(String key, [List<String> defaultValue = const <String>[]]) async {
    var sp = await SharedPreferences.getInstance();
    var value = sp.getStringList(key);
    return value ?? defaultValue;
  }

  /// *
  /// 取数据
  ///
  static Future getPreference(String key,
      Object defaultValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (defaultValue is int) {
      return prefs.getInt(key);
    }
    else if (defaultValue is double) {
      return prefs.getDouble(key);
    }
    else if (defaultValue is bool) {
      return prefs.getBool(key);
    }
    else if (defaultValue is String) {
      return prefs.getString(key);
    }
    else if (defaultValue is List) {
      return prefs.getStringList(key);
    }
    else {
      throw Exception("不能得到这种类型");
    }
  }

  /// *
  /// 删除指定数据
  static void remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key); //删除指定键
  }

  /// *
  /// 清空整个缓存
  static void clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear(); ////清空缓存
  }
}
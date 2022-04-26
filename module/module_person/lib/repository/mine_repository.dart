import 'dart:io';

import 'package:lib_cache/cache_manager.dart';

class MineRepository {
  static const String user_avatar_path = "user_avatar_path";

  static String getAvatarPath() {
    // return '';
    String value = '';
    CacheManager.getPreference(user_avatar_path, value).then((value) => value);
    return value;
  }

  static saveAvatarPath(File file) async {
    CacheManager.set(user_avatar_path, file.path);
  }
}

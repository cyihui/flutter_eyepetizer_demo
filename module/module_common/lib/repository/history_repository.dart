import 'dart:convert';

import 'package:lib_cache/cache_manager.dart';
import 'package:module_common/model/common_item_model.dart';

class HistoryRepository {
  static const String watch_history_list_key = "watch_history_list";

  static saveWatchHistory(Data? data) async {
    List<String> watchList = [];
    // List<String> watchList = loadHistoryData();
    CacheManager.getStringList(watch_history_list_key, watchList).then((value) {
      print("history_repository==>saveWatchHistory:value:$value");
      watchList.addAll(value);
      var jsonParam = data?.toJson();
      var jsonStr = json.encode(jsonParam);
      if (!watchList.contains(jsonStr)) {
        watchList.add(json.encode(jsonParam));
        CacheManager.set(watch_history_list_key, watchList);
      }
    });

  }

  static List<String> loadHistoryData() {
    List<String>? originList = [];

    // 获取
     CacheManager.getStringList(watch_history_list_key, originList).then((value) {
      print("history_repository==>loadHistoryData:value:$value");
      originList.addAll(value);
    });
    List<String> watchList;

    if (originList == null) {
      watchList = [];
    } else {
      watchList = originList.map((e) => e.toString()).toList();
    }
    print("history_repository==>loadHistoryData:originList$originList");
    print("history_repository==>loadHistoryData:watchList$watchList");
    return watchList;
  }




  static Future<List<String>> getCache() async {
    List<String> originList = [];
    List<String> watchList = await CacheManager.getStringList(watch_history_list_key, originList);
    return watchList;
  }

  static saveHistoryData(List<String> watchHistoryList) {
    CacheManager.set(watch_history_list_key, watchHistoryList);
  }
}

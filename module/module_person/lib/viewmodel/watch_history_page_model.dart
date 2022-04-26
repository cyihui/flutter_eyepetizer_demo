import 'dart:convert';

import 'package:lib_cache/cache_manager.dart';
import 'package:lib_core/viewmodel/base_change_notifier_model.dart';
import 'package:module_common/model/common_item_model.dart';
import 'package:module_common/repository/history_repository.dart';

class WatchHistoryPageModel extends BaseChangeNotifierModel {
  List<Data> itemList = [];
  List<String> watchList = [];

  void loadData() async {
    // 获取
    String watch_history_list_key = "watch_history_list";
    watchList = await CacheManager.getStringList(watch_history_list_key, watchList);
    // watchList = HistoryRepository.loadHistoryData();
    if (watchList != null) {
      var list = watchList.map((value) {
        return Data.fromJson(json.decode(value));
      }).toList();
      itemList = list;
      notifyListeners();
    }
  }

  Future<void> remove(int index) async {
    watchList.removeAt(index);
    HistoryRepository.saveHistoryData(watchList);
    loadData();
  }
}

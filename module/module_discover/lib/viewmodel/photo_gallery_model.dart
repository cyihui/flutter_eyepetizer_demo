

import 'package:lib_core/viewmodel/base_change_notifier_model.dart';

class PhotoGalleryModel extends BaseChangeNotifierModel {
  int currentIndex = 1;

  changeIndex(int index) {
    this.currentIndex = index + 1;
    notifyListeners();
  }
}

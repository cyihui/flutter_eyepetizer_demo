
import 'package:lib_core/model/paging_model.dart';

class NewsModel extends PagingModel<NewsItemModel> {
  int? count;
  int? total;
  bool? adExist;

  NewsModel({this.count, this.total, this.adExist});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['itemList'] != null) {
      itemList = [];
      json['itemList'].forEach((v) {
        itemList?.add(NewsItemModel.fromJson(v));
      });
    }
    count = json['count'];
    total = json['total'];
    nextPageUrl = json['nextPageUrl'];
    adExist = json['adExist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (itemList != null) {
      data['itemList'] = itemList?.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['total'] = total;
    data['nextPageUrl'] = nextPageUrl;
    data['adExist'] = adExist;
    return data;
  }
}

class NewsItemModel {
  String? type;
  Data? data;
  int? id;
  int? adIndex;

  NewsItemModel({this.type, this.data, this.id, this.adIndex});

  NewsItemModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    id = json['id'];
    adIndex = json['adIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['id'] = id;
    data['adIndex'] = adIndex;
    return data;
  }
}

class Data {
  String? dataType;
  int? id;
  String? type;
  String? text;
  String? actionUrl;
  List<String>? titleList;
  String? backgroundImage;

  Data(
      {this.dataType,
      this.id,
      this.type,
      this.text,
      this.actionUrl,
      this.titleList,
      this.backgroundImage});

  Data.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    id = json['id'];
    type = json['type'];
    text = json['text'];
    actionUrl = json['actionUrl'];
    if(json['titleList'] !=null){
      titleList = json['titleList'].cast<String>();
    }
    backgroundImage = json['backgroundImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataType'] = dataType;
    data['id'] = id;
    data['type'] = type;
    data['text'] = text;
    data['actionUrl'] = actionUrl;
    data['titleList'] = titleList;
    data['backgroundImage'] = backgroundImage;
    return data;
  }
}

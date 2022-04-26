

import 'package:lib_core/model/paging_model.dart';

class TopicModel extends PagingModel<TopicItemModel>{
  int? count;
  int? total;
  bool? adExist;

  TopicModel(
      {this.count, this.total, this.adExist});

  TopicModel.fromJson(Map<String, dynamic> json) {
    if (json['itemList'] != null) {
      itemList = [];
      json['itemList'].forEach((v) {
        itemList?.add(TopicItemModel.fromJson(v));
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

class TopicItemModel {
  String? type;
  Data? data;

  TopicItemModel({this.type, this.data});

  TopicItemModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? dataType;
  int? id;
  String? title;
  String? description;
  String? image;
  String? actionUrl;
  bool? shade;
  Label? label;
  Null header;
  bool? autoPlay;

  Data(
      {this.dataType,
        this.id,
        this.title,
        this.description,
        this.image,
        this.actionUrl,
        this.shade,
        this.label,
        this.header,
        this.autoPlay});

  Data.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    actionUrl = json['actionUrl'];
    shade = json['shade'];
    label = json['label'] != null ? Label.fromJson(json['label']) : null;
    header = json['header'];
    autoPlay = json['autoPlay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataType'] = dataType;
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['actionUrl'] = actionUrl;
    data['shade'] = shade;
    if (label != null) {
      data['label'] = label?.toJson();
    }
    data['header'] = header;
    data['autoPlay'] = autoPlay;
    return data;
  }
}

class Label {
  String? text;
  String? card;
  Null detail;

  Label({this.text, this.card, this.detail});

  Label.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    card = json['card'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['card'] = card;
    data['detail'] = detail;
    return data;
  }
}
import 'package:module_common/model/common_item_model.dart';

class TopicDetailModel {
  int? id;
  String? headerImage;
  String? brief;
  String? text;
  String? shareLink;
  List<TopicDetailItemData>? itemList;
  int? count;

  TopicDetailModel(
      {this.id,
      this.headerImage = '',
      this.brief = '',
      this.text = '',
      this.shareLink,
      this.itemList,
      this.count});

  TopicDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headerImage = json['headerImage'];
    brief = json['brief'];
    text = json['text'];
    shareLink = json['shareLink'];
    if (json['itemList'] != null) {
      itemList = [];
      json['itemList'].forEach((v) {
        itemList?.add(TopicDetailItemData.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['headerImage'] = headerImage;
    data['brief'] = brief;
    data['text'] = text;
    data['shareLink'] = shareLink;
    if (itemList != null) {
      data['itemList'] = itemList?.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class TopicDetailItemData {
  String? type;
  ContentDataModel? data;
  int? id;
  int? adIndex;

  TopicDetailItemData({this.type, this.data, this.id, this.adIndex});

  TopicDetailItemData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null
        ? ContentDataModel.fromJson(json['data'])
        : null;
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

class ContentDataModel {
  String? dataType;
  Header? header;
  ContentModel? content;

  ContentDataModel({this.dataType, this.header, this.content});

  ContentDataModel.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    header =
        json['header'] != null ? Header.fromJson(json['header']) : null;
    content = json['content'] != null
        ? ContentModel.fromJson(json['content'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataType'] = dataType;
    if (header != null) {
      data['header'] = header?.toJson();
    }
    if (content != null) {
      data['content'] = content?.toJson();
    }
    return data;
  }
}

class Header {
  int? id;
  String? actionUrl;
  Null labelList;
  String? icon;
  String? iconType;
  int? time;
  bool? showHateVideo;
  String? followType;
  int? tagId;
  String? issuerName;
  bool? topShow;

  Header(
      {this.id,
      this.actionUrl,
      this.labelList,
      this.icon,
      this.iconType,
      this.time,
      this.showHateVideo,
      this.followType,
      this.tagId,
      this.issuerName,
      this.topShow});

  Header.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    actionUrl = json['actionUrl'];
    labelList = json['labelList'];
    icon = json['icon'];
    iconType = json['iconType'];
    time = json['time'];
    showHateVideo = json['showHateVideo'];
    followType = json['followType'];
    tagId = json['tagId'];
    issuerName = json['issuerName'];
    topShow = json['topShow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['actionUrl'] = actionUrl;
    data['labelList'] = labelList;
    data['icon'] = icon;
    data['iconType'] = iconType;
    data['time'] = time;
    data['showHateVideo'] = showHateVideo;
    data['followType'] = followType;
    data['tagId'] = tagId;
    data['issuerName'] = issuerName;
    data['topShow'] = topShow;
    return data;
  }
}

class ContentModel {
  String? type;
  Data? data;

  ContentModel({this.type, this.data});

  ContentModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (this.data != null) {
      data['header'] = this.data?.toJson();
    }
    return data;
  }
}

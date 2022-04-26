
import 'package:lib_core/model/paging_model.dart';

class RecommendModel extends PagingModel<RecommendItem>{
  int? count;
  int? total;
  bool? adExist;

  RecommendModel(
      {this.count, this.total, this.adExist});

  RecommendModel.fromJson(Map<String, dynamic> json) {
    if (json['itemList'] != null) {
      itemList = [];
      json['itemList'].forEach((v) {
        itemList?.add(RecommendItem.fromJson(v));
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

class RecommendItem {
  String? type;
  Data? data;
  RecommendItem({this.type, this.data});

  RecommendItem.fromJson(Map<String, dynamic> json) {
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
  Header? header;
  CommunityModel? content;

  Data(
      {this.dataType,
      this.header,
      this.content});

  Data.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    header =
        json['header'] != null ? Header.fromJson(json['header']) : null;
    content = json['content'] != null
        ? CommunityModel.fromJson(json['content'])
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
  String? icon;
  String? iconType;
  bool? showHateVideo;
  String? followType;
  String? issuerName;
  bool? topShow;

  Header(
      {this.id,
      this.actionUrl,
      this.icon,
      this.iconType,
      this.showHateVideo,
      this.followType,
      this.issuerName,
      this.topShow});

  Header.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    actionUrl = json['actionUrl'];
    icon = json['icon'];
    iconType = json['iconType'];
    showHateVideo = json['showHateVideo'];
    followType = json['followType'];
    issuerName = json['issuerName'];
    topShow = json['topShow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['actionUrl'] = actionUrl;
    data['icon'] = icon;
    data['iconType'] = iconType;
    data['showHateVideo'] = showHateVideo;
    data['followType'] = followType;
    data['issuerName'] = issuerName;
    data['topShow'] = topShow;
    return data;
  }
}

class CommunityModel {
  String? type;
  ContentData? data;

  CommunityModel({this.type, this.data});

  CommunityModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? ContentData.fromJson(json['data']) : null;
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

class ContentData {
  String? dataType;
  int? id;
  String? title;
  String? description;
  String? library;
  List<Tags>? tags;
  Consumption? consumption;
  String? resourceType;
  int? uid;
  bool? collected;
  bool? reallyCollected;
  Owner? owner;
  Cover? cover;
  String? checkStatus;
  String? area;
  String? city;
  bool? ifMock;
  String? validateStatus;
  String? validateResult;
  bool? addWatermark;
  String? url;
  String? playUrl;
  int? width;
  int? height;
  List<String>? urls;
  List<String>? urlsWithWatermark;

  ContentData(
      {this.dataType,
      this.id,
      this.title,
      this.description,
      this.library,
      this.tags,
      this.consumption,
      this.resourceType,
      this.uid,
      this.collected,
      this.reallyCollected,
      this.owner,
      this.cover,
      this.checkStatus,
      this.area,
      this.city,
      this.ifMock,
      this.validateStatus,
      this.validateResult,
      this.addWatermark,
      this.url,
        this.playUrl,
        this.width,
        this.height,
      this.urls,
      this.urlsWithWatermark});

  ContentData.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    library = json['library'];
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags?.add(Tags.fromJson(v));
      });
    }
    consumption = json['consumption'] != null
        ? Consumption.fromJson(json['consumption'])
        : null;
    resourceType = json['resourceType'];
    uid = json['uid'];
    collected = json['collected'];
    reallyCollected = json['reallyCollected'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    cover = json['cover'] != null ? Cover.fromJson(json['cover']) : null;
    checkStatus = json['checkStatus'];
    area = json['area'];
    city = json['city'];
    ifMock = json['ifMock'];
    validateStatus = json['validateStatus'];
    validateResult = json['validateResult'];
    addWatermark = json['addWatermark'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    playUrl = json['playUrl'] != null ?json['playUrl']:null;
    urls = json['urls'] != null ?json['urls'].cast<String>():null;
    urlsWithWatermark = json['urlsWithWatermark'] != null ?json['urlsWithWatermark'].cast<String>():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataType'] = dataType;
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['library'] = library;
    if (tags != null) {
      data['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    if (consumption != null) {
      data['consumption'] = consumption?.toJson();
    }
    data['resourceType'] = resourceType;
    data['uid'] = uid;
    data['collected'] = collected;
    data['reallyCollected'] = reallyCollected;
    if (owner != null) {
      data['owner'] = owner?.toJson();
    }
    if (playUrl != null) {
      data['playUrl'] = playUrl;
    }
    if (cover != null) {
      data['cover'] = cover?.toJson();
    }
    data['checkStatus'] = checkStatus;
    data['area'] = area;
    data['city'] = city;
    data['ifMock'] = ifMock;
    data['validateStatus'] = validateStatus;
    data['validateResult'] = validateResult;
    data['addWatermark'] = addWatermark;
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    if(urls !=null){
      data['urls'] = urls;
    }
    if(urlsWithWatermark !=null){
      data['urlsWithWatermark'] = urlsWithWatermark;
    }
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  String? actionUrl;
  String? desc;
  String? bgPicture;
  String? headerImage;
  String? tagRecType;
  bool? haveReward;
  bool? ifNewest;

  Tags(
      {this.id,
      this.name,
      this.actionUrl,
      this.desc,
      this.bgPicture,
      this.headerImage,
      this.tagRecType,
      this.haveReward,
      this.ifNewest});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    actionUrl = json['actionUrl'];
    desc = json['desc'];
    bgPicture = json['bgPicture'];
    headerImage = json['headerImage'];
    tagRecType = json['tagRecType'];
    haveReward = json['haveReward'];
    ifNewest = json['ifNewest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['actionUrl'] = actionUrl;
    data['desc'] = desc;
    data['bgPicture'] = bgPicture;
    data['headerImage'] = headerImage;
    data['tagRecType'] = tagRecType;
    data['haveReward'] = haveReward;
    data['ifNewest'] = ifNewest;
    return data;
  }
}

class Consumption {
  int? collectionCount;
  int? shareCount;
  int? replyCount;
  int? realCollectionCount;

  Consumption(
      {this.collectionCount,
      this.shareCount,
      this.replyCount,
      this.realCollectionCount});

  Consumption.fromJson(Map<String, dynamic> json) {
    collectionCount = json['collectionCount'];
    shareCount = json['shareCount'];
    replyCount = json['replyCount'];
    realCollectionCount = json['realCollectionCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionCount'] = collectionCount;
    data['shareCount'] = shareCount;
    data['replyCount'] = replyCount;
    data['realCollectionCount'] = realCollectionCount;
    return data;
  }
}

class Owner {
  String? nickname;
  String? avatar;
  String? userType;
  bool? ifPgc;
  String? description;
  String? area;
  String? gender;
  String? cover;
  String? actionUrl;
  bool? followed;
  bool? limitVideoOpen;
  bool? expert;

  Owner(
      {
      this.nickname,
      this.avatar,
      this.userType,
      this.ifPgc,
      this.description,
      this.area,
      this.gender,
      this.cover,
      this.actionUrl,
      this.followed,
      this.limitVideoOpen,
      this.expert});

  Owner.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    avatar = json['avatar'];
    userType = json['userType'];
    ifPgc = json['ifPgc'];
    description = json['description'];
    area = json['area'];
    gender = json['gender'];
    cover = json['cover'];
    actionUrl = json['actionUrl'];
    followed = json['followed'];
    limitVideoOpen = json['limitVideoOpen'];
    expert = json['expert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['avatar'] = avatar;
    data['userType'] = userType;
    data['ifPgc'] = ifPgc;
    data['description'] = description;
    data['area'] = area;
    data['gender'] = gender;
    data['cover'] = cover;
    data['actionUrl'] = actionUrl;
    data['followed'] = followed;
    data['limitVideoOpen'] = limitVideoOpen;
    data['expert'] = expert;
    return data;
  }
}

class Cover {
  String? feed;
  String? detail;

  Cover({this.feed, this.detail});

  Cover.fromJson(Map<String, dynamic> json) {
    feed = json['feed'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['feed'] = feed;
    data['detail'] = detail;
    return data;
  }
}

import 'package:lib_core/model/paging_model.dart';

class Issue extends PagingModel<Item> {
  int? total;
  int? date;
  int? publishTime;
  int? releaseTime;
  int? count;
  String? type;

  Issue(
      {this.total,
      this.date,
      this.publishTime,
      this.releaseTime,
      this.count,
      this.type});

  Issue.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    date = json['date'];
    publishTime = json['publishTime'];
    releaseTime = json['releaseTime'];
    count = json['count'];
    if (json['itemList'] != null) {
      itemList = [];
      for (var v in (json['itemList'] as List)) {
        itemList?.add(Item.fromJson(v));
      }
    }
    type = json['type'];
    nextPageUrl = json['nextPageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['date'] = date;
    data['publishTime'] = publishTime;
    data['releaseTime'] = releaseTime;
    data['count'] = count;
    if (itemList != null) {
      data['itemList'] = itemList?.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    data['nextPageUrl'] = nextPageUrl;
    return data;
  }
}

class Item {
  Data? data;
  int? adIndex;
  int? id;
  String? type;

  Item({this.data, this.adIndex, this.id, this.type});

  Item.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    adIndex = json['adIndex'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['adIndex'] = adIndex;
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class Data {
  int? date;
  int? releaseTime;
  String? description;
  bool? collected;
  String? remark;
  String? title;
  String? type;
  String? playUrl;
  Cover? cover;
  int? duration;
  String? descriptionEditor;
  String? xLibrary;
  Provide? provider;
  int? id;
  bool? ad;
  Author? author;
  String? dataType;
  int? searchWeight;
  Consumption? consumption;
  bool? played;
  List<Tag>? tags;
  List<PlayInfo>? playInfo;
  bool? ifLimitVideo;
  WebUrl? webUrl;
  String? category;
  int? idx;
  String? resourceType;
  String? text;
  Header? header;
  List<Item>? itemList;
  String time = DateTime.now().toString();

  Data(
      {this.date,
      this.releaseTime,
      this.description,
      this.collected,
      this.remark,
      this.title,
      this.type,
      this.playUrl,
      this.cover,
      this.duration,
      this.descriptionEditor,
      this.xLibrary,
      this.provider,
      this.id,
      this.ad,
      this.author,
      this.dataType,
      this.searchWeight,
      this.consumption,
      this.played,
      this.tags,
      this.playInfo,
      this.ifLimitVideo,
      this.webUrl,
      this.category,
      this.idx,
      this.resourceType,
      this.text,
      this.header,
      this.itemList});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    releaseTime = json['releaseTime'];
    description = json['description'];
    collected = json['collected'];
    remark = json['remark'];
    title = json['title'];
    type = json['type'];
    playUrl = json['playUrl'];
    cover = json['cover'] != null ? Cover.fromJson(json['cover']) : null;
    duration = json['duration'];
    descriptionEditor = json['descriptionEditor'];
    xLibrary = json['library'];
    provider = json['provider'] != null
        ? Provide.fromJson(json['provider'])
        : null;
    id = json['id'];
    ad = json['ad'];
    author =
        json['author'] != null ? Author.fromJson(json['author']) : null;
    dataType = json['dataType'];
    searchWeight = json['searchWeight'];
    consumption = json['consumption'] != null
        ? Consumption.fromJson(json['consumption'])
        : null;
    played = json['played'];
    if (json['tags'] != null) {
      tags = [];
      for (var v in (json['tags'] as List)) {
        tags?.add(Tag.fromJson(v));
      }
    }
    if (json['playInfo'] != null) {
      playInfo = [];
      for (var v in (json['playInfo'] as List)) {
        playInfo?.add(PlayInfo.fromJson(v));
      }
    }
    ifLimitVideo = json['ifLimitVideo'];
    webUrl =
        json['webUrl'] != null ? WebUrl.fromJson(json['webUrl']) : null;
    category = json['category'];
    idx = json['idx'];
    resourceType = json['resourceType'];
    text = json['text'];
    header =
        json['header'] != null ? Header.fromJson(json['header']) : null;
    if (json['itemList'] != null) {
      itemList = [];
      for (var v in (json['itemList'] as List)) {
        itemList?.add(Item.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['releaseTime'] = releaseTime;
    data['description'] = description;
    data['collected'] = collected;
    data['remark'] = remark;
    data['title'] = title;
    data['type'] = type;
    data['playUrl'] = playUrl;
    if (cover != null) {
      data['cover'] = cover?.toJson();
    }
    data['duration'] = duration;
    data['descriptionEditor'] = descriptionEditor;
    data['library'] = xLibrary;
    if (provider != null) {
      data['provider'] = provider?.toJson();
    }
    data['id'] = id;
    data['ad'] = ad;
    if (author != null) {
      data['author'] = author?.toJson();
    }
    data['dataType'] = dataType;
    data['searchWeight'] = searchWeight;
    if (consumption != null) {
      data['consumption'] = consumption?.toJson();
    }
    data['played'] = played;
    if (tags != null) {
      data['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    if (playInfo != null) {
      data['playInfo'] = playInfo?.map((v) => v.toJson()).toList();
    }
    data['ifLimitVideo'] = ifLimitVideo;
    if (webUrl != null) {
      data['webUrl'] = webUrl?.toJson();
    }
    data['category'] = category;
    data['idx'] = idx;
    data['resourceType'] = resourceType;
    data['text'] = text;
    if (header != null) {
      data['header'] = header?.toJson();
    }
    if (itemList != null) {
      data['itemList'] = itemList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cover {
  String? feed;
  String? detail;
  String? blurred;
  String? homepage;

  Cover({this.feed, this.detail, this.blurred, this.homepage});

  Cover.fromJson(Map<String, dynamic> json) {
    feed = json['feed'];
    detail = json['detail'];
    blurred = json['blurred'];
    homepage = json['homepage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['feed'] = feed;
    data['detail'] = detail;
    data['blurred'] = blurred;
    data['homepage'] = homepage;
    return data;
  }
}

class WebUrl {
  String? forWeibo;
  String? raw;

  WebUrl({this.forWeibo, this.raw});

  WebUrl.fromJson(Map<String, dynamic> json) {
    forWeibo = json['forWeibo'];
    raw = json['raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['forWeibo'] = forWeibo;
    data['raw'] = raw;
    return data;
  }
}

class PlayInfo {
  String? name;
  int? width;
  List<IssueIssuelistItemlistDataPlayinfoUrllist>? urlList;
  String? type;
  String? url;
  int? height;

  PlayInfo(
      {this.name, this.width, this.urlList, this.type, this.url, this.height});

  PlayInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    width = json['width'];
    if (json['urlList'] != null) {
      urlList = [];
      for (var v in (json['urlList'] as List)) {
        urlList?.add(IssueIssuelistItemlistDataPlayinfoUrllist.fromJson(v));
      }
    }
    type = json['type'];
    url = json['url'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['width'] = width;
    if (urlList != null) {
      data['urlList'] = urlList?.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    data['url'] = url;
    data['height'] = height;
    return data;
  }
}

class Author {
  IssueIssuelistItemlistDataAuthorShield? shield;
  bool? expert;
  int? approvedNotReadyVideoCount;
  String? icon;
  String? link;
  String? description;
  int? videoNum;
  IssueIssuelistItemlistDataAuthorFollow? follow;
  int? recSort;
  bool? ifPgc;
  String? name;
  int? latestReleaseTime;
  int? id;

  Author(
      {this.shield,
      this.expert,
      this.approvedNotReadyVideoCount,
      this.icon,
      this.link,
      this.description,
      this.videoNum,
      this.follow,
      this.recSort,
      this.ifPgc,
      this.name,
      this.latestReleaseTime,
      this.id});

  Author.fromJson(Map<String, dynamic> json) {
    shield = json['shield'] != null
        ? IssueIssuelistItemlistDataAuthorShield.fromJson(json['shield'])
        : null;
    expert = json['expert'];
    approvedNotReadyVideoCount = json['approvedNotReadyVideoCount'];
    icon = json['icon'];
    link = json['link'];
    description = json['description'];
    videoNum = json['videoNum'];
    follow = json['follow'] != null
        ? IssueIssuelistItemlistDataAuthorFollow.fromJson(json['follow'])
        : null;
    recSort = json['recSort'];
    ifPgc = json['ifPgc'];
    name = json['name'];
    latestReleaseTime = json['latestReleaseTime'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shield != null) {
      data['shield'] = shield?.toJson();
    }
    data['expert'] = expert;
    data['approvedNotReadyVideoCount'] = approvedNotReadyVideoCount;
    data['icon'] = icon;
    data['link'] = link;
    data['description'] = description;
    data['videoNum'] = videoNum;
    if (follow != null) {
      data['follow'] = follow?.toJson();
    }
    data['recSort'] = recSort;
    data['ifPgc'] = ifPgc;
    data['name'] = name;
    data['latestReleaseTime'] = latestReleaseTime;
    data['id'] = id;
    return data;
  }
}

class IssueIssuelistItemlistDataPlayinfoUrllist {
  int? size;
  String? name;
  String? url;

  IssueIssuelistItemlistDataPlayinfoUrllist({this.size, this.name, this.url});

  IssueIssuelistItemlistDataPlayinfoUrllist.fromJson(
      Map<String, dynamic> json) {
    size = json['size'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class IssueIssuelistItemlistDataAuthorShield {
  int? itemId;
  String? itemType;
  bool? shielded;

  IssueIssuelistItemlistDataAuthorShield(
      {this.itemId, this.itemType, this.shielded});

  IssueIssuelistItemlistDataAuthorShield.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    itemType = json['itemType'];
    shielded = json['shielded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemId'] = itemId;
    data['itemType'] = itemType;
    data['shielded'] = shielded;
    return data;
  }
}

class IssueIssuelistItemlistDataAuthorFollow {
  int? itemId;
  String? itemType;
  bool? followed;

  IssueIssuelistItemlistDataAuthorFollow(
      {this.itemId, this.itemType, this.followed});

  IssueIssuelistItemlistDataAuthorFollow.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    itemType = json['itemType'];
    followed = json['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemId'] = itemId;
    data['itemType'] = itemType;
    data['followed'] = followed;
    return data;
  }
}

class Tag {
  String? tagRecType;
  String? headerImage;
  String? actionUrl;
  int? communityIndex;
  String? name;
  int? id;
  String? bgPicture;

  Tag(
      {this.tagRecType,
      this.headerImage,
      this.actionUrl,
      this.communityIndex,
      this.name,
      this.id,
      this.bgPicture});

  Tag.fromJson(Map<String, dynamic> json) {
    tagRecType = json['tagRecType'];
    headerImage = json['headerImage'];
    actionUrl = json['actionUrl'];
    communityIndex = json['communityIndex'];
    name = json['name'];
    id = json['id'];
    bgPicture = json['bgPicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tagRecType'] = tagRecType;
    data['headerImage'] = headerImage;
    data['actionUrl'] = actionUrl;
    data['communityIndex'] = communityIndex;
    data['name'] = name;
    data['id'] = id;
    data['bgPicture'] = bgPicture;
    return data;
  }
}

class Header {
  String? actionUrl;
  String? description;
  bool? expert;
  String? icon;
  String? iconType;
  int? id;
  bool? ifPgc;
  bool? ifShowNotificationIcon;
  String? title;
  int? uid;

  Header(
      {this.actionUrl,
      this.description,
      this.expert,
      this.icon,
      this.iconType,
      this.id,
      this.ifPgc,
      this.ifShowNotificationIcon,
      this.title,
      this.uid});

  Header.fromJson(Map<String, dynamic> json) {
    actionUrl = json['actionUrl'];
    description = json['description'];
    expert = json['expert'];
    icon = json['icon'];
    iconType = json['iconType'];
    id = json['id'];
    ifPgc = json['ifPgc'];
    ifShowNotificationIcon = json['ifShowNotificationIcon'];
    title = json['title'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['actionUrl'] = actionUrl;
    data['description'] = description;
    data['expert'] = expert;
    data['icon'] = icon;
    data['iconType'] = iconType;
    data['id'] = id;
    data['ifPgc'] = ifPgc;
    data['ifShowNotificationIcon'] = ifShowNotificationIcon;
    data['title'] = title;
    data['uid'] = uid;
    return data;
  }
}

class Consumption {
  int? shareCount;
  int? replyCount;
  int? collectionCount;
  int? realCollectionCount;

  Consumption(
      {this.shareCount,
      this.replyCount,
      this.collectionCount,
      this.realCollectionCount});

  Consumption.fromJson(Map<String, dynamic> json) {
    shareCount = json['shareCount'];
    replyCount = json['replyCount'];
    collectionCount = json['collectionCount'];
    realCollectionCount = json['realCollectionCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shareCount'] = shareCount;
    data['replyCount'] = replyCount;
    data['collectionCount'] = collectionCount;
    data['realCollectionCount'] = realCollectionCount;
    return data;
  }
}

class Provide {
  String? icon;
  String? name;
  String? alias;

  Provide({this.icon, this.name, this.alias});

  Provide.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['name'] = name;
    data['alias'] = alias;
    return data;
  }
}

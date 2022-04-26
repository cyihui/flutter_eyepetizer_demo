class TabInfoModel {
  TabInfo? tabInfo;
  PgcInfo? pgcInfo;

  TabInfoModel({this.tabInfo,this.pgcInfo});

  TabInfoModel.fromJson(Map<String, dynamic> json) {
    tabInfo =
        json['tabInfo'] != null ? TabInfo.fromJson(json['tabInfo']) : null;
    pgcInfo =
    json['pgcInfo'] != null ? PgcInfo.fromJson(json['pgcInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tabInfo != null) {
      data['tabInfo'] = tabInfo?.toJson();
    }
    return data;
  }
}

class TabInfo {
  List<TabInfoItem>? tabList;
  int? defaultIdx;

  TabInfo({this.tabList, this.defaultIdx});

  TabInfo.fromJson(Map<String, dynamic> json) {
    if (json['tabList'] != null) {
      tabList = [];
      for (var v in (json['tabList'] as List)) {
        tabList?.add(TabInfoItem.fromJson(v));
      }
    }
    defaultIdx = json['defaultIdx'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tabList != null) {
      data['tabList'] = tabList?.map((v) => v.toJson()).toList();
    }
    data['defaultIdx'] = defaultIdx;
    return data;
  }
}

class TabInfoItem {
  int? nameType;
  String? apiUrl;
  String? name;
  int? tabType;
  int? id;
  dynamic adTrack;

  TabInfoItem(
      {this.nameType,
      this.apiUrl,
      this.name,
      this.tabType,
      this.id,
      this.adTrack});

  TabInfoItem.fromJson(Map<String, dynamic> json) {
    nameType = json['nameType'];
    apiUrl = json['apiUrl'];
    name = json['name'];
    tabType = json['tabType'];
    id = json['id'];
    adTrack = json['adTrack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameType'] = nameType;
    data['apiUrl'] = apiUrl;
    data['name'] = name;
    data['tabType'] = tabType;
    data['id'] = id;
    data['adTrack'] = adTrack;
    return data;
  }
}

class PgcInfo {
  String? dataType;
  int? id;
  String? icon;
  String? name;
  String? brief;
  String? description;
  String? actionUrl;
  String? area;
  String? gender;
  int? registDate;
  int? followCount;
  Follow? follow;
  bool? self;
  String? cover;
  int? videoCount;
  int? shareCount;
  int? collectCount;
  int? myFollowCount;
  String? videoCountActionUrl;
  String? myFollowCountActionUrl;
  String? followCountActionUrl;
  String? privateMessageActionUrl;
  int? medalsNum;
  String? medalsActionUrl;
  String? tagNameExport;
  int? worksRecCount;
  int? worksSelectedCount;
  Shield? shield;
  bool? expert;

  PgcInfo(
      {this.dataType,
        this.id,
        this.icon,
        this.name,
        this.brief,
        this.description,
        this.actionUrl,
        this.area,
        this.gender,
        this.registDate,
        this.followCount,
        this.follow,
        this.self,
        this.cover,
        this.videoCount,
        this.shareCount,
        this.collectCount,
        this.myFollowCount,
        this.videoCountActionUrl,
        this.myFollowCountActionUrl,
        this.followCountActionUrl,
        this.privateMessageActionUrl,
        this.medalsNum,
        this.medalsActionUrl,
        this.tagNameExport,
        this.worksRecCount,
        this.worksSelectedCount,
        this.shield,
        this.expert});

  PgcInfo.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    brief = json['brief'];
    description = json['description'];
    actionUrl = json['actionUrl'];
    area = json['area'];
    gender = json['gender'];
    registDate = json['registDate'];
    followCount = json['followCount'];
    follow =
    json['follow'] != null ? Follow.fromJson(json['follow']) : null;
    self = json['self'];
    cover = json['cover'];
    videoCount = json['videoCount'];
    shareCount = json['shareCount'];
    collectCount = json['collectCount'];
    myFollowCount = json['myFollowCount'];
    videoCountActionUrl = json['videoCountActionUrl'];
    myFollowCountActionUrl = json['myFollowCountActionUrl'];
    followCountActionUrl = json['followCountActionUrl'];
    privateMessageActionUrl = json['privateMessageActionUrl'];
    medalsNum = json['medalsNum'];
    medalsActionUrl = json['medalsActionUrl'];
    tagNameExport = json['tagNameExport'];
    worksRecCount = json['worksRecCount'];
    worksSelectedCount = json['worksSelectedCount'];
    shield =
    json['shield'] != null ? Shield.fromJson(json['shield']) : null;
    expert = json['expert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataType'] = dataType;
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    data['brief'] = brief;
    data['description'] = description;
    data['actionUrl'] = actionUrl;
    data['area'] = area;
    data['gender'] = gender;
    data['registDate'] = registDate;
    data['followCount'] = followCount;
    if (follow != null) {
      data['follow'] = follow?.toJson();
    }
    data['self'] = self;
    data['cover'] = cover;
    data['videoCount'] = videoCount;
    data['shareCount'] = shareCount;
    data['collectCount'] = collectCount;
    data['myFollowCount'] = myFollowCount;
    data['videoCountActionUrl'] = videoCountActionUrl;
    data['myFollowCountActionUrl'] = myFollowCountActionUrl;
    data['followCountActionUrl'] = followCountActionUrl;
    data['privateMessageActionUrl'] = privateMessageActionUrl;
    data['medalsNum'] = medalsNum;
    data['medalsActionUrl'] = medalsActionUrl;
    data['tagNameExport'] = tagNameExport;
    data['worksRecCount'] = worksRecCount;
    data['worksSelectedCount'] = worksSelectedCount;
    if (shield != null) {
      data['shield'] = shield?.toJson();
    }
    data['expert'] = expert;
    return data;
  }
}

class Follow {
  String? itemType;
  int? itemId;
  bool? followed;

  Follow({this.itemType, this.itemId, this.followed});

  Follow.fromJson(Map<String, dynamic> json) {
    itemType = json['itemType'];
    itemId = json['itemId'];
    followed = json['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemType'] = itemType;
    data['itemId'] = itemId;
    data['followed'] = followed;
    return data;
  }
}

class Shield {
  String? itemType;
  int? itemId;
  bool? shielded;

  Shield({this.itemType, this.itemId, this.shielded});

  Shield.fromJson(Map<String, dynamic> json) {
    itemType = json['itemType'];
    itemId = json['itemId'];
    shielded = json['shielded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemType'] = itemType;
    data['itemId'] = itemId;
    data['shielded'] = shielded;
    return data;
  }
}

import 'package:lib_core/model/paging_model.dart';
import 'package:module_common/model/common_item_model.dart';

class IssueEntity extends PagingModel<Item> {
  int? nextPublishTime;
  String? newestIssueType;
  List<Issue>? issueList;

  IssueEntity({this.nextPublishTime, this.newestIssueType});

  IssueEntity.fromJson(Map<String, dynamic> json) {
    nextPublishTime = json['nextPublishTime'];
    newestIssueType = json['newestIssueType'];
    nextPageUrl = json['nextPageUrl'];
    if (json['issueList'] != null) {
      issueList = [];
      itemList = [];
      for (var v in (json['issueList'] as List)) {
        issueList?.add(Issue.fromJson(v));
      }
      itemList = issueList?[0].itemList;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['nextPublishTime'] = nextPublishTime;
    data['newestIssueType'] = newestIssueType;
    data['nextPageUrl'] = nextPageUrl;
    if (issueList != null) {
      data['issueList'] = issueList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

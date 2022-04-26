import 'package:lib_navigator/lib_navigator.dart';
import 'package:flutter/material.dart';
import 'package:lib_image/lib_image.dart';
import 'package:lib_utils/date_util.dart';
import 'package:lib_utils/share_util.dart';
import 'package:module_common/model/common_item_model.dart';

class RankWidgetItem extends StatelessWidget {
  final Item item;
  final bool showCategory;
  final bool showDivider;

  const RankWidgetItem(
      {Key? key,
      required this.item,
      this.showCategory = true,
      this.showDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cover = item.data?.cover;
    var feed = cover?.feed;
    var category = item.data?.category;
    var duration = item.data?.duration;
    var title = item.data?.title;
    var author = item.data?.author;
    var name = author?.name;
    var description = item.data?.description;
    feed ??= "";
    category ??= "";
    title ??= "";
    duration ??= 0;
    String descriptionInfo = "";
    if (author == null) {
      if (description != null) {
        descriptionInfo = description;
      }
    } else {
      if (name != null) {
        descriptionInfo = name;
      }
    }

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            toNamed("/detail", item.data);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                    child: Hero(
                        tag: '${item.data?.id}${item.data?.time}',
                        child: cacheImage(feed,
                            width: MediaQuery.of(context).size.width,
                            height: 200)), //充满容器，可能会被截断
                    borderRadius: BorderRadius.circular(4)),
                Positioned(
                    left: 15,
                    top: 10,
                    child: Opacity(
                        opacity: showCategory ? 1.0 : 0.0, //处理控件显示或隐藏
                        child: ClipOval(
                            child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white54),
                                height: 44,
                                width: 44,
                                alignment: AlignmentDirectional.center,
                                child: Text(category,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white)))))),
                Positioned(
                    right: 15,
                    bottom: 10,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                            decoration:
                                const BoxDecoration(color: Colors.black54),
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              formatDateMsByMS(duration * 1000),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ))))
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Row(
            children: <Widget>[
              _authorHeaderImage(item),
              Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis),
                          Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(descriptionInfo,
                                  style: const TextStyle(
                                      color: Color(0xff9a9a9a), fontSize: 12)))
                        ],
                      ))),
              IconButton(
                  icon: const Icon(Icons.share, color: Colors.black38),
                  onPressed: () => share(title, item.data?.playUrl))
            ],
          ),
        ),
        Offstage(
          offstage: showDivider,
          child: const Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: const Divider(height: 0.5)),
        )
      ],
    );
  }

  Widget _authorHeaderImage(Item item) {
    var author = item.data?.author;
    var provider = item.data?.provider;
    var authorIcon = author?.icon;
    var providerIcon = provider?.icon;
    var id = author?.id;
    String icon = "";
    if (authorIcon != null) {
      icon = authorIcon;
    } else if (providerIcon != null) {
      icon = providerIcon;
    }
    return InkWell(
      child: ClipOval(
          clipBehavior: Clip.antiAlias,
          child: cacheImage(
              icon,
              width: 40,
              height: 40)),
      onTap: () => toNamed('/author', id),
    );
  }
}

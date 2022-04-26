import 'package:flutter/material.dart';
import 'package:lib_image/lib_image.dart';
import 'package:lib_navigator/lib_navigator.dart';
import 'package:lib_utils/date_util.dart';
import 'package:module_common/model/common_item_model.dart';

class SearchVideoWidgetItem extends StatelessWidget {
  final Item item;

  const SearchVideoWidgetItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id = item.data?.id;
    var time = item.data?.time;
    var title = item.data?.title;
    var duration = item.data?.duration;
    var feed = item.data?.cover?.feed;
    feed??="";
    title??="";
    duration??=0;
    return GestureDetector(
        onTap: () {
          toNamed('/detail', item.data);
        },
        child: Container(
            child: Stack(alignment: Alignment.center, children: <Widget>[
          Hero(
              tag: '$id$time',
              child: cacheImage(
                feed,
                width: double.infinity, //撑满整个屏幕
                height: 220,
              )),
          Positioned(
              child: Column(children: <Widget>[
            Text(
              title,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.black54),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        formatDateMsByMS(duration * 1000),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ))),
            )
          ]))
        ])));
  }
}

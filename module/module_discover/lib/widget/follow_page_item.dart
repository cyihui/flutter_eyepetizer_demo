import 'package:flutter/material.dart';
import 'package:lib_image/lib_image.dart';
import 'package:lib_navigator/lib_navigator.dart';
import 'package:module_common/model/common_item_model.dart';
import 'package:module_discover/constant/string.dart';
import 'follow_widget_item.dart';

class FollowPageItem extends StatelessWidget {
  final Item item;

  const FollowPageItem({Key ?key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    toNamed('/author', item.data?.header?.id);
                  },
                  child: ClipOval(
                      child: cacheImage(
                    item.data?.header?.icon ?? '',
                    width: 40,
                    height: 40,
                  )),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(item.data?.header?.title ?? '',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14)),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(item.data?.header?.description ?? '',
                                  style: const TextStyle(
                                      color: Colors.black26, fontSize: 12),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(color: Color(0xFFF4F4F4)),
                    child: const Text(
                      add_follow,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 230,
            child: ListView.builder(
                itemCount: item.data?.itemList?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var length = item.data?.itemList?.length ?? 0;
                  var itemInfo = item.data?.itemList?[index] ?? Item();
                  return FollowWidgetItem(
                      item: itemInfo,
                      last: index == length - 1);
                }),
          )
        ],
      ),
    );
  }
}

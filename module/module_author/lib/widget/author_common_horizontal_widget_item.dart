import 'package:flutter/material.dart';
import 'package:module_author/widget/special_horizontal_widget_item.dart';
import 'package:module_common/model/common_item_model.dart';

class AuthorCommonHorizontalWidgetItem extends StatelessWidget {
  final Item item;

  const AuthorCommonHorizontalWidgetItem({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 240,
      child: ListView.builder(
        itemBuilder: (context, index) {
          var itemInfo = item.data?.itemList?[index] ?? Item();
          var length = item.data?.itemList?.length ?? 0;
          return SpecialHorizontalWidgetItem(
            item: itemInfo,
            isLast: index == length - 1,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: item.data?.itemList?.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lib_image/lib_image.dart';
import 'package:lib_navigator/lib_navigator.dart';
import 'package:module_discover/constant/color.dart';
import 'package:module_discover/model/news_model.dart';
import 'package:module_discover/page/web_page.dart';

class NewsTitleWidgetItem extends StatelessWidget {
  final NewsItemModel newsItemModel;

  const NewsTitleWidgetItem({Key? key, required this.newsItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Text(newsItemModel.data?.text ?? '',
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff3f3f3f))),
    );
  }
}

class NewsContentWidgetItem extends StatelessWidget {
  final NewsItemModel newsItemModel;

  const NewsContentWidgetItem({Key? key, required this.newsItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          var actionUrl = newsItemModel.data?.actionUrl ?? '';
          String url = Uri.decodeComponent(actionUrl
              .substring(actionUrl.indexOf("url")));
          url = url.substring(4, url.length);
          toPage(WebPage(url: url));
        },
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: PhysicalModel(
              color: const Color(0xFFEDEDED),
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: cacheImage(newsItemModel.data?.backgroundImage ?? "",
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            fit: BoxFit.fill),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _getTitleList(newsItemModel.data?.titleList ?? []),
                      )
                    ],
                  )),
            )));
  }

  List<Widget> _getTitleList(List<String> titleList) {
    return titleList.map((title) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Text(title,
              style: TextStyle(color: desTextColor, fontSize: 12),
              maxLines: 3,
              overflow: TextOverflow.ellipsis));
    }).toList();
  }
}

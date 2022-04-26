import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lib_core/widget/provider_widget.dart';
import 'package:lib_ui/widget/loading_container.dart';
import 'package:module_discover/viewmodel/category_page_model.dart';
import 'package:module_discover/widget/category_widget_item.dart';

import 'category_detail_page.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<CategoryPageModel>(
      model: CategoryPageModel(),
      onModelInit: (model) {
        model.loadData();
      },
      builder: (context, model, child) {
        return LoadingContainer(
          viewState: model.viewState,
          retry: model.retry,
          child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Color(0xfff2f2f2)),
              child: GridView.builder(
                  itemCount: model.list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return OpenContainer(closedBuilder: (context, action) {
                      return CategoryWidgetItem(
                          categoryModel: model.list[index]);
                    }, openBuilder: (context, action) {
                      return CategoryDetailPage(
                          categoryModel: model.list[index]);
                    });
                  })),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

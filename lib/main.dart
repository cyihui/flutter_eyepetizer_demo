import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eyepetizer_demo/app_initialize.dart';
import 'package:flutter_eyepetizer_demo/navigation/tab_navigation.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:lib_cache/cache_manager.dart';
import 'package:lib_navigator/lib_navigator.dart';
import 'package:module_author/page/author_page.dart';
import 'package:module_common/constant/http_constant.dart';
import 'package:module_detail/page/video_detail_page.dart';
import 'package:module_home/page/home_page.dart';

void main() {
  runApp(const App());
  //Flutter沉浸式状态栏
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future:  AppInitialize.init(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        print("state${snapshot.connectionState}");
        // var widget = snapshot.connectionState == ConnectionState.done
        //     ? const TabNavigation()
        //     : const Scaffold(
        //   body: Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // );
        return GetMaterialAppWidget(
          // child: widget,
          child: TabNavigation(),
        );
      },
    );
  }
}

class GetMaterialAppWidget extends StatefulWidget {
  final Widget child;

  const GetMaterialAppWidget({Key? key, required this.child}) : super(key: key);

  @override
  _GetMaterialAppWidgetState createState() => _GetMaterialAppWidgetState();
}

class _GetMaterialAppWidgetState extends State<GetMaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Eyepetizer',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => widget.child),
        GetPage(name: '/detail', page: () => const VideoDetailPage()),
        GetPage(name: '/author', page: () => const AuthorPage()),
      ],
    );
  }
}

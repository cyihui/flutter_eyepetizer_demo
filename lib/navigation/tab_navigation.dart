import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_core/widget/provider_widget.dart';
import 'package:lib_utils/toast_util.dart';
import 'package:module_discover/page/discovery_page.dart';
import 'package:module_home/page/home_page.dart';
import 'package:module_hot/page/rank_page.dart';
import 'package:module_person/page/mine_page.dart';

import '../config/string.dart';
import '../viewmodel/tab_navigation_model.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({Key? key}) : super(key: key);

  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  final PageController _pageController = PageController();
  late DateTime lastTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              HomePage(),
              DiscoveryPage(),
              RankPage(),
              MinePage()
            ],
          ),
          bottomNavigationBar: ProviderWidget<TabNavigationModel>(
              model: TabNavigationModel(),
              builder: (context, model, child) {
                return BottomNavigationBar(
                  currentIndex: model.currentIndex,
                  onTap: (index) {
                    if (model.currentIndex != index) {
                      _pageController.jumpToPage(index);
                      model.changeBottomTabIndex(index);
                    }
                  },
                  type: BottomNavigationBarType.fixed,
                  //显示标题
                  items: [
                    _bottomItem(
                        DString.daily_paper,
                        'images/ic_home_normal.png',
                        'images/ic_home_selected.png'),
                    _bottomItem(
                        DString.discover,
                        'images/ic_discovery_normal.png',
                        'images/ic_discovery_selected.png'),
                    _bottomItem(DString.hot, 'images/ic_hot_normal.png',
                        'images/ic_hot_selected.png'),
                    _bottomItem(DString.mime, 'images/ic_mine_normal.png',
                        'images/ic_mine_selected.png')
                  ],
                  selectedItemColor: const Color(0xff000000),
                  unselectedItemColor: const Color(0xff9a9a9a),
                );
              }),
        ),
        onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() async {
    if (lastTime == null ||
        DateTime.now().difference(lastTime) > const Duration(seconds: 2)) {
      lastTime = DateTime.now();
      showTip(DString.exit_tip);
      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }

  _bottomItem(String title, String normalIcon, String selectIcon) {
    return BottomNavigationBarItem(
        icon: Image.asset(normalIcon, width: 24, height: 24),
        activeIcon: Image.asset(selectIcon, width: 24, height: 24),
        label: title);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
///需要保持状态的页面
///第一步：状态类继承 AutomaticKeepAliveClientMixin
///第二步：重写方法 wantKeepAlive => true
///第三步：build方法中，写父类build方法： super.build(context);/
class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin{
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  bool get wantKeepAlive => true;
}
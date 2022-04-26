import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_navigator/lib_navigator.dart';
import 'package:lib_video/video_widget.dart';
import 'package:module_discover/model/recommend_model.dart';

class RecommendVideoPlayPage extends StatefulWidget {
  final RecommendItem item;

  const RecommendVideoPlayPage({Key? key, required this.item}) : super(key: key);

  @override
  _RecommendVideoPlayPageState createState() => _RecommendVideoPlayPageState();
}

class _RecommendVideoPlayPageState extends State<RecommendVideoPlayPage>
    with WidgetsBindingObserver {
  final GlobalKey<VideoWidgetState> videoKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      videoKey.currentState?.pause();
    } else if (state == AppLifecycleState.resumed) {
      videoKey.currentState?.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = widget.item.data?.content?.data?.height ?? 0;
    var width = widget.item.data?.content?.data?.width ?? 0;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: Stack(
            children: <Widget>[
              Align(
                  child: VideoWidget(
                key: videoKey,
                url: widget.item.data?.content?.data?.playUrl ?? '',
                aspectRatio: _getAspectRatio(),
                allowFullScreen: !(height > width),
              )),
              Positioned(
                  left: 10,
                  top: MediaQuery.of(context).padding.top + 10,
                  child: GestureDetector(
                    onTap: () => back(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      width: 24,
                      height: 24,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  double _getAspectRatio() {
    var height = widget.item.data?.content?.data?.height ?? 0;
    var width = widget.item.data?.content?.data?.width ?? 0;
    double aspectRatio = 16 / 9;
    bool allowFullScreen = height > width;
    if (allowFullScreen) {
      final size = MediaQuery.of(context).size;
      final width = size.width;
      final height = size.height;
      aspectRatio = width / height;
    }
    return aspectRatio;
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}

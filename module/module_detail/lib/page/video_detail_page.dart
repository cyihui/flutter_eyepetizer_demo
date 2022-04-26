import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_core/widget/provider_widget.dart';
import 'package:lib_utils/event_bus.dart';
import 'package:lib_video/video_widget.dart';
import 'package:lib_image/lib_image.dart';
import 'package:lib_ui/widget/loading_container.dart';
import 'package:lib_utils/date_util.dart';
import 'package:lib_navigator/lib_navigator.dart';
import 'package:module_common/event/watch_video_event.dart';
import 'package:module_common/model/common_item_model.dart';
import 'package:module_common/repository/history_repository.dart';
import 'package:module_common/widget/video_relate_widget_item.dart';
import 'package:module_detail/constant/string.dart';
import 'package:module_detail/viewmodel/video_detail_page_model.dart';
import 'package:module_detail/widget/appbar_widget.dart';

const VIDEO_SMALL_CARD_TYPE = 'videoSmallCard';

class VideoDetailPage extends StatefulWidget {
  final Data? videoDta;

  const VideoDetailPage({Key? key, this.videoDta}) : super(key: key);

  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage>
    with WidgetsBindingObserver {
  final GlobalKey<VideoWidgetState> videoKey = GlobalKey();

  Data? data;

  @override
  void initState() {
    super.initState();
    //监听页面可见与不可见状态
    data = widget.videoDta == null ? arguments() : widget.videoDta;
    WidgetsBinding.instance?.addObserver(this);
    HistoryRepository.saveWatchHistory(data);
    Bus.getInstance()?.send(WatchVideoEvent());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //AppLifecycleState当前页面的状态(是否可见)
    if (state == AppLifecycleState.paused) {
      //页面不可见时,暂停视频
      videoKey.currentState?.pause();
    } else if (state == AppLifecycleState.resumed) {
      videoKey.currentState?.play();
    }
  }

  @override
  void dispose() {
    //移除监听页面可见与不可见状态
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var id = data?.id ?? 0;
    var time = data?.time ?? '';
    var playUrl = data?.playUrl ?? '';
    var blurred = data?.cover?.blurred ?? '';
    var title = data?.title ?? '';
    var category = data?.category ?? '';
    var latestReleaseTime = data?.author?.latestReleaseTime ?? 0;
    var description = data?.description ?? '';
    var collectionCount = data?.consumption?.collectionCount ?? 0;
    var shareCount = data?.consumption?.shareCount ?? 0;
    var replyCount = data?.consumption?.replyCount ?? 0;
    var icon = data?.author?.icon ?? '';
    var name = data?.author?.name ?? '';
    var authorDescription = data?.author?.description ?? '';

    return Scaffold(body: ProviderWidget<VideoDetailPageModel>(
        model: VideoDetailPageModel(),
        onModelInit: (model) {
          model.loadVideoRelateData(id);
        },
        builder: (context, model, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
              child: Scaffold(
                  body: Column(children: <Widget>[
                    _statusBar(),
                    Hero(
                      //Hero动画
                        tag: '$id$time',
                        child: VideoWidget(
                          key: videoKey,
                          url: playUrl,
                          overlayUI: videoAppBar(),
                        )),
                    Expanded(
                        flex: 1,
                        child: LoadingContainer(
                            viewState: model.viewState,
                            retry: model.retry,
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      //背景图片
                                        fit: BoxFit.cover,
                                        image: cachedNetworkImageProvider(
                                            '$blurred/thumbnail/${MediaQuery.of(context).size.height}x${MediaQuery.of(context).size.width}'))),
                                child: CustomScrollView(
                                  //CustomScrollView结合Sliver可以防止滚动冲突
                                  slivers: <Widget>[
                                    SliverToBoxAdapter(
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 10),
                                                child: Text(
                                                  title,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 10),
                                                child: Text(
                                                    '#$category / ${formatDateMsByYMDHM(latestReleaseTime)}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12))),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 10, right: 10),
                                                child: Text(description,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14))),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Image.asset(
                                                          'images/ic_like.png',
                                                          height: 22,
                                                          width: 22,
                                                          package: 'module_detail',
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                              left: 3),
                                                          child: Text(
                                                            '$collectionCount',
                                                            style: const TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 13),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(left: 30),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Image.asset(
                                                              'images/ic_share_white.png',
                                                              height: 22,
                                                              width: 22,
                                                              package:
                                                              'module_detail'),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.only(
                                                                left: 3),
                                                            child: Text(
                                                              '$shareCount',
                                                              style: const TextStyle(
                                                                  color:
                                                                  Colors.white,
                                                                  fontSize: 13),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(left: 30),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Image.asset(
                                                              'images/icon_comment.png',
                                                              height: 22,
                                                              width: 22,
                                                              package:
                                                              'module_detail'),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.only(
                                                                left: 3),
                                                            child: Text(
                                                              '$replyCount',
                                                              style: const TextStyle(
                                                                  color:
                                                                  Colors.white,
                                                                  fontSize: 13),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            const Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                    height: 0.5,
                                                    color: Colors.white)),
                                            Row(children: <Widget>[
                                              Padding(
                                                  padding: const EdgeInsets.all(10),
                                                  child: ClipOval(
                                                    child: cacheImage(
                                                        icon,
                                                        height: 40,
                                                        width: 40),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(name,
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              color: Colors.white)),
                                                      Padding(
                                                          padding: const EdgeInsets.only(
                                                              top: 3),
                                                          child: Text(
                                                              authorDescription,
                                                              style: const TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .white)))
                                                    ],
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                    padding: const EdgeInsets.all(5),
                                                    child: const Text(add_follow,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.grey,
                                                            fontSize: 12))),
                                              ),
                                            ]),
                                            const Divider(
                                                height: 0.5, color: Colors.white)
                                          ]),
                                    ),
                                    SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                                (context, index) {
                                              if (model.itemList[index].type ==
                                                  VIDEO_SMALL_CARD_TYPE) {
                                                var itemData = model
                                                    .itemList[index].data ??  Data();
                                                return VideoRelateWidgetItem(
                                                    data: itemData,
                                                    callBack: () {
                                                      videoKey.currentState?.pause();
                                                      toPage(
                                                          VideoDetailPage(
                                                              videoDta: itemData),
                                                          preventDuplicates: false);
                                                    });
                                              }
                                              return Padding(
                                                  padding: const EdgeInsets.all(10),
                                                  child: Text(
                                                    model.itemList[index].data?.text ?? '',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16),
                                                  ));
                                              //return
                                            }, childCount: model.itemList.length))
                                  ],
                                ))))
                  ])),
              value: SystemUiOverlayStyle.light);
        }));
    // return ProviderWidget<VideoDetailPageModel>(
    //     model: VideoDetailPageModel(),
    //     onModelInit: (model) {
    //       model.loadVideoRelateData(id);
    //     },
    //     builder: (context, model, child) {
    //       return AnnotatedRegion<SystemUiOverlayStyle>(
    //           child: Scaffold(
    //               body: Column(children: <Widget>[
    //             _statusBar(),
    //             Hero(
    //                 //Hero动画
    //                 tag: '$id$time',
    //                 child: VideoWidget(
    //                   key: videoKey,
    //                   url: playUrl,
    //                   overlayUI: videoAppBar(),
    //                 )),
    //             Expanded(
    //                 flex: 1,
    //                 child: LoadingContainer(
    //                     viewState: model.viewState,
    //                     retry: model.retry,
    //                     child: Container(
    //                         decoration: BoxDecoration(
    //                             image: DecorationImage(
    //                                 //背景图片
    //                                 fit: BoxFit.cover,
    //                                 image: cachedNetworkImageProvider(
    //                                     '$blurred/thumbnail/${MediaQuery.of(context).size.height}x${MediaQuery.of(context).size.width}'))),
    //                         child: CustomScrollView(
    //                           //CustomScrollView结合Sliver可以防止滚动冲突
    //                           slivers: <Widget>[
    //                             SliverToBoxAdapter(
    //                               child: Column(
    //                                   crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                   children: <Widget>[
    //                                     Padding(
    //                                         padding: const EdgeInsets.only(
    //                                             left: 10, top: 10),
    //                                         child: Text(
    //                                           title,
    //                                           style: const TextStyle(
    //                                               fontSize: 18,
    //                                               color: Colors.white,
    //                                               fontWeight: FontWeight.bold),
    //                                         )),
    //                                     Padding(
    //                                         padding: const EdgeInsets.only(
    //                                             left: 10, top: 10),
    //                                         child: Text(
    //                                             '#$category / ${formatDateMsByYMDHM(latestReleaseTime)}',
    //                                             style: const TextStyle(
    //                                                 color: Colors.white,
    //                                                 fontSize: 12))),
    //                                     Padding(
    //                                         padding: const EdgeInsets.only(
    //                                             left: 10, top: 10, right: 10),
    //                                         child: Text(description,
    //                                             style: const TextStyle(
    //                                                 color: Colors.white,
    //                                                 fontSize: 14))),
    //                                     Padding(
    //                                         padding: const EdgeInsets.only(
    //                                             left: 10, top: 10),
    //                                         child: Row(
    //                                           children: <Widget>[
    //                                             Row(
    //                                               children: <Widget>[
    //                                                 Image.asset(
    //                                                   'images/ic_like.png',
    //                                                   height: 22,
    //                                                   width: 22,
    //                                                   package: 'module_detail',
    //                                                 ),
    //                                                 Padding(
    //                                                   padding: const EdgeInsets.only(
    //                                                       left: 3),
    //                                                   child: Text(
    //                                                     '$collectionCount',
    //                                                     style: const TextStyle(
    //                                                         color: Colors.white,
    //                                                         fontSize: 13),
    //                                                   ),
    //                                                 )
    //                                               ],
    //                                             ),
    //                                             Padding(
    //                                               padding:
    //                                                   const EdgeInsets.only(left: 30),
    //                                               child: Row(
    //                                                 children: <Widget>[
    //                                                   Image.asset(
    //                                                       'images/ic_share_white.png',
    //                                                       height: 22,
    //                                                       width: 22,
    //                                                       package:
    //                                                           'module_detail'),
    //                                                   Padding(
    //                                                     padding:
    //                                                         const EdgeInsets.only(
    //                                                             left: 3),
    //                                                     child: Text(
    //                                                       '$shareCount',
    //                                                       style: const TextStyle(
    //                                                           color:
    //                                                               Colors.white,
    //                                                           fontSize: 13),
    //                                                     ),
    //                                                   )
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding:
    //                                                   const EdgeInsets.only(left: 30),
    //                                               child: Row(
    //                                                 children: <Widget>[
    //                                                   Image.asset(
    //                                                       'images/icon_comment.png',
    //                                                       height: 22,
    //                                                       width: 22,
    //                                                       package:
    //                                                           'module_detail'),
    //                                                   Padding(
    //                                                     padding:
    //                                                         const EdgeInsets.only(
    //                                                             left: 3),
    //                                                     child: Text(
    //                                                       '$replyCount',
    //                                                       style: const TextStyle(
    //                                                           color:
    //                                                               Colors.white,
    //                                                           fontSize: 13),
    //                                                     ),
    //                                                   )
    //                                                 ],
    //                                               ),
    //                                             )
    //                                           ],
    //                                         )),
    //                                     const Padding(
    //                                         padding: EdgeInsets.only(top: 10),
    //                                         child: Divider(
    //                                             height: 0.5,
    //                                             color: Colors.white)),
    //                                     Row(children: <Widget>[
    //                                       Padding(
    //                                           padding: const EdgeInsets.all(10),
    //                                           child: ClipOval(
    //                                             child: cacheImage(
    //                                                 icon,
    //                                                 height: 40,
    //                                                 width: 40),
    //                                           )),
    //                                       Expanded(
    //                                           flex: 1,
    //                                           child: Column(
    //                                             crossAxisAlignment:
    //                                                 CrossAxisAlignment.start,
    //                                             children: <Widget>[
    //                                               Text(name,
    //                                                   style: const TextStyle(
    //                                                       fontSize: 15,
    //                                                       color: Colors.white)),
    //                                               Padding(
    //                                                   padding: const EdgeInsets.only(
    //                                                       top: 3),
    //                                                   child: Text(
    //                                                       authorDescription,
    //                                                       style: const TextStyle(
    //                                                           fontSize: 13,
    //                                                           color: Colors
    //                                                               .white)))
    //                                             ],
    //                                           )),
    //                                       Padding(
    //                                         padding: const EdgeInsets.only(right: 10),
    //                                         child: Container(
    //                                             decoration: BoxDecoration(
    //                                                 color: Colors.white,
    //                                                 borderRadius:
    //                                                     BorderRadius.circular(
    //                                                         5)),
    //                                             padding: const EdgeInsets.all(5),
    //                                             child: const Text(add_follow,
    //                                                 style: TextStyle(
    //                                                     fontWeight:
    //                                                         FontWeight.bold,
    //                                                     color: Colors.grey,
    //                                                     fontSize: 12))),
    //                                       ),
    //                                     ]),
    //                                     const Divider(
    //                                         height: 0.5, color: Colors.white)
    //                                   ]),
    //                             ),
    //                             SliverList(
    //                                 delegate: SliverChildBuilderDelegate(
    //                                     (context, index) {
    //                               if (model.itemList[index].type ==
    //                                   VIDEO_SMALL_CARD_TYPE) {
    //                                 var itemData = model
    //                                     .itemList[index].data ??  Data();
    //                                 return VideoRelateWidgetItem(
    //                                     data: itemData,
    //                                     callBack: () {
    //                                       videoKey.currentState?.pause();
    //                                       toPage(
    //                                           VideoDetailPage(
    //                                               videoDta: itemData),
    //                                           preventDuplicates: false);
    //                                     });
    //                               }
    //                               return Padding(
    //                                   padding: const EdgeInsets.all(10),
    //                                   child: Text(
    //                                     model.itemList[index].data?.text ?? '',
    //                                     style: const TextStyle(
    //                                         color: Colors.white,
    //                                         fontWeight: FontWeight.bold,
    //                                         fontSize: 16),
    //                                   ));
    //                               //return
    //                             }, childCount: model.itemList.length))
    //                           ],
    //                         ))))
    //           ])),
    //           value: SystemUiOverlayStyle.light);
    //     });
  }

  _statusBar() {
    return Container(
      height: MediaQuery.of(context).padding.top,
      color: Colors.black,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../api/request.dart';
import 'views/swiper_diy.dart';
import 'views/grid_view.dart';
import 'views/ad_banner.dart';
import 'views/shop_info.dart';
import 'views/recommend.dart';
import 'views/floor_view.dart';
import 'views/hot_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeData;
  List hotGoodsList = List();
  int page = 1;

  // 防止页面重绘时多次调用，增加内容消耗
  var _futureBuilderFuture = requestPost(HomePageContent,
    postData: {'lon': '115.02932', 'lat': '35.76'});

  RefreshController _refreshController = RefreshController();

  // 下拉刷新加载首页数据
  void _onRefresh() async {
    page = 1;
    await requestPost(HomePageContent,
      postData: {'lon': '115.02932', 'lat': '35.76'}).then((value) {
      setState(() {
        if (value != null) {
          homeData = value;
          _refreshController.refreshCompleted();
        } else {
          _refreshController.resetNoData();
        }
      });
    });
  }

  // 上拉加载火爆专区
  void _onLoadingHot() async {
    page++;
    await requestPost(HomePageHotBlock, postData: {'page': page}).then((value) {
      setState(() {
        if (value != null) {
          hotGoodsList.addAll(value);
          _refreshController.loadComplete();
        } else {
          _refreshController.loadNoData();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('百姓生活+(By 唐艳琼)')),
        body: FutureBuilder(
          // 完美解决异步请求，动态渲染的问题
          future: _futureBuilderFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              homeData = snapshot.data;
              return SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
//                header: WaterDropHeader(),
                header: CustomHeader(
                    builder: (BuildContext context, RefreshStatus status) {
                  Widget body;
                  if (status == RefreshStatus.idle) {
                    body = Text('下拉刷新');
                  } else if (status == RefreshStatus.refreshing) {
                    body = CupertinoActivityIndicator();
                  } else if (status == RefreshStatus.failed) {
                    body = Text("刷新失败！点击重试！");
                  } else if (status == RefreshStatus.canRefresh) {
                    body = Text("松开刷新数据");
                  } else if (status == RefreshStatus.completed) {
                    body = Text("刷新完成");
                  } else {
                    body = Text("没有最新数据了!");
                  }
                  return Container(
                    height: 55,
                    child: Center(child: body),
                  );
                }),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("上拉加载");
                    } else if (mode == LoadStatus.loading) {
                      body = CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("加载失败！点击重试！");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("松手加载更多!");
                    } else {
                      body = Text("没有更多数据了!");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoadingHot,
                child: ListView(
                  children: [
                    SwiperDiy(swiperDataList: homeData['slides']),
                    CustomGridView(gridList: homeData['category']),
                    AdBanner(adObject: homeData['advertesPicture']),
                    ShopInfo(shopObject: homeData['shopInfo']),
                    Recommend(recommendList: homeData['recommend']),
                    FloorView(
                        floorList: homeData['floor1'],
                        headerObject: homeData['floor1Pic']),
                    FloorView(
                        floorList: homeData['floor2'],
                        headerObject: homeData['floor2Pic']),
                    FloorView(
                        floorList: homeData['floor3'],
                        headerObject: homeData['floor3Pic']),
                    HotList(
                      hotGoodsList: hotGoodsList,
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  '正在加载中...',
                ),
              );
            }
          },
        ));
  }
}

import 'package:flutter/material.dart';
import '../../api/request.dart';
import 'views/swiper_diy.dart';
import 'views/grid_view.dart';
import 'views/ad_banner.dart';
import 'views/shop_info.dart';
import 'views/recommend.dart';
import 'views/floor_view.dart';
import 'views/hot_list.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+(By 唐艳琼)')),
      body: FutureBuilder( // 完美解决异步请求，动态渲染的问题
        future: requestPost(HomePageContent, postData: {'lon': '115.02932', 'lat': '35.76'}),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var data = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SwiperDiy(swiperDataList: data['slides']),
                  CustomGridView(gridList: data['category']),
                  AdBanner(adObject: data['advertesPicture']),
                  ShopInfo(shopObject: data['shopInfo']),
                  Recommend(recommendList: data['recommend']),
                  FloorView(floorList: data['floor1'], headerObject: data['floor1Pic']),
                  FloorView(floorList: data['floor2'], headerObject: data['floor2Pic']),
                  FloorView(floorList: data['floor3'], headerObject: data['floor3Pic']),
                  HotList()
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
      )
    );
  }
}

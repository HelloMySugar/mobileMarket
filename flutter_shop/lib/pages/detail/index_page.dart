import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/detail_info.dart';
import './views/top_view.dart';
import './views/explain_view.dart';
import './views/tab_bar.dart';
import './views/web_view.dart';
import './views/bottom_view.dart';

class DetailPage extends StatelessWidget {
  String goodsId;
  DetailPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('商品详情'),
        ),
        body: FutureBuilder(
          future: _getDetailInfo(context),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Stack(
                children: [
                  Container(
                    child: ListView(
                      children: [
                        DetailTopView(),
                        ExplainView(),
                        DetailTabBar(),
                        DetailWebView()
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: DetailBottomView(),
                  )
                ],
              );
            }else{
              return Center(
                child: Text('加载中...'),
              );
            }
          },
        ),
      )
    );
  }
  Future _getDetailInfo (BuildContext context) async {
    await Provide.value<DetailInfoProvide>(context).getGoodsInfo(goodsId);
    return '完成加载';
  }
}

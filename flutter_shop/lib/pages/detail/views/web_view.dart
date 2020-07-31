import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/provide/detail_info.dart';
import 'package:provide/provide.dart';

class DetailWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailInfoProvide> (
      builder: (context, child, detailInfoProvide) {
        bool isLeftClicked = Provide.value<DetailInfoProvide>(context).tabIsLeft;
        if (isLeftClicked) {
          var goodsDetail = Provide.value<DetailInfoProvide>(context).goodsInfo.goodInfo.goodsDetail;
          return Container(
            child: Html(
              data: goodsDetail,
            )
          );
        } else {
          return Container(
            width: ScreenUtil().setWidth(750),
            height: 200,
            alignment: Alignment.center,
            child: Text('暂无数据',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(32)
              ),
            )
          );
        }
      }
    );
  }
}

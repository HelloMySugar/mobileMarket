import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../../provide/detail_info.dart';

class DetailTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailInfoProvide> (
      builder: (context, child, detailInfoProvide) {
        var isLeftClicked = detailInfoProvide.tabIsLeft;
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              _myTabBarItem(context, '详情', isLeftClicked),
              _myTabBarItem(context, '评论', !isLeftClicked)
            ],
          ),
        );
      },
    );
  }

  _myTabBarItem(context, titleStr, isChoose) {
    return InkWell(
      onTap: () {
        Provide.value<DetailInfoProvide>(context).changeTabBarLeft(titleStr == '详情' ? true : false);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(750/2),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: isChoose ? Colors.pink : Colors.black12
            )
          )
        ),
        child: Text(titleStr,
          style: TextStyle(
            color: isChoose ? Colors.pink : Colors.black,
            fontSize: ScreenUtil().setSp(30)
          ),
        ),
      ),
    );
  }
}

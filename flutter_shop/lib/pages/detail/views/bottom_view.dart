import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../../provide/detail_info.dart';
import '../../../provide/cart.dart';

class DetailBottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(90),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black12,
            width: 1
          )
        )
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: ScreenUtil().setWidth(140),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // 加入购物车
              var goodInfo = Provide.value<DetailInfoProvide>(context).goodsInfo.goodInfo;
              Provide.value<CartProvide>(context).addToCart(goodInfo.goodsId, goodInfo.goodsName, goodInfo.presentPrice, goodInfo.image1);
            },
            child: Container(
              width: ScreenUtil().setWidth((750-140)/2),
              alignment: Alignment.center,
              color: Colors.green,
              child: Text(
                '加入购物车',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(30)
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // 立即购买
              Provide.value<CartProvide>(context).clearAll();
            },
            child: Container(
              width: ScreenUtil().setWidth((750-140)/2),
              alignment: Alignment.center,
              color: Colors.red,
              child: Text(
                '立即购买',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(30)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

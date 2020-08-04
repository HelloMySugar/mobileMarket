import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../../provide/detail_info.dart';
import '../../../provide/cart.dart';
import 'package:toast/toast.dart';
import '../../../provide/tabbar_index.dart';

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
          Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Provide.value<TabBarIndexProvide>(context).changeTabBarIndex(2);
                },
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
              Positioned(
                top: 3,
                right: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.white,
                      width: 1
                    )
                  ),
                  child: Provide<CartProvide>(
                    builder: (context, child, cartProvide){
                      return Text(
                        cartProvide.goodsTotalCount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(22)
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              // 加入购物车
              var goodInfo = Provide.value<DetailInfoProvide>(context).goodsInfo.goodInfo;
              Provide.value<CartProvide>(context).addCount(goodInfo.goodsId, goodsName: goodInfo.goodsName, price: goodInfo.presentPrice, image: goodInfo.image1);
              Toast.show(
                '加入购物车成功',
                context,
                gravity: Toast.CENTER
              );
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

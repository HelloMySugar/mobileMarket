import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../../provide/cart.dart';

class CartTotalBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(120),
      padding: EdgeInsets.all(10),
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
          _getAllBtn(context),
          _getCenterShow(context),
          _getDoneBtn(context)
        ],
      ),
    );
  }

  _getAllBtn(context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      margin: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Provide<CartProvide>(
            builder: (context, child, cartProvide) {
              bool isAllChoose = cartProvide.isAllChoose;
              return Checkbox(
                value: isAllChoose,
                onChanged: (flag) {
                  Provide.value<CartProvide>(context).chooseAllOrNot(flag);
                },
                activeColor: Colors.pink,
              );
            },
          ),
          Container(
            child: Text(
              '全选',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30)
              )
            ),
          )
        ],
      ),
    );
  }

  _getCenterShow(context) {
    return Container(
      width: ScreenUtil().setWidth(365),
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: ScreenUtil().setWidth(225),
                alignment: Alignment.centerRight,
                child: Text(
                  '合计：',
                  style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(28)),
                )
              ),
              Container(
                width: ScreenUtil().setWidth(140),
                alignment: Alignment.centerRight,
                child: Provide<CartProvide>(
                  builder: (context, child, cartProvide) {
                    var totalPrice = cartProvide.goodsTotalPrice;
                    return Text(
                      '￥ ${totalPrice.toStringAsFixed(2)}', // 保留2位小数
                      style: TextStyle(color: Colors.red, fontSize: ScreenUtil().setSp(28)),
                    );
                  }
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送费',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(20)
              ),
            ),
          )
        ],
      ),
    );
  }

  _getDoneBtn(context) {
    return Container(
      width: ScreenUtil().setWidth(115),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.red
      ),
      alignment: Alignment.center,
      child: Provide<CartProvide>(
        builder: (context, child, cartProvide) {
          int totalCount = cartProvide.goodsTotalCount;
          return Text(
            '结算(${totalCount.toString()})',
            style: TextStyle(
              color: Colors.white
            )
          );
        }
      )
    );
  }
}

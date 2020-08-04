import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';
import '../../../api/model/cartInfo.dart';
import 'package:toast/toast.dart';
import '../../../routers/application.dart';

class CartCell extends StatelessWidget {
  final CartInfoModel cartInfoModel;
  CartCell(this.cartInfoModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1
          )
        )
      ),
      child: InkWell(
        onTap: () {
          Application.router.navigateTo(context, '/detail?id=${cartInfoModel.goodsId}');
        },
        child: Row(
          children: [
            _getChooseBtn(context),
            _getGoodsImg(),
            Container(
              width: ScreenUtil().setWidth(370),
              height: ScreenUtil().setHeight(150),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  _getGoodsName(),
                  _getCounter(context)
                ],
              )
            ),
            _getRightWidget(context)
          ],
        )
      )
    );
  }

  // 勾选按钮
  _getChooseBtn(context) {
    return Container(
      child: Checkbox(
        value: cartInfoModel.isChecked,
        //不能为null，如果为 true，value 为 null 的时候显示禁用标识
        tristate: false,
        activeColor: Colors.pink,
        onChanged: (flag) {
          Provide.value<CartProvide>(context).update(cartInfoModel.goodsId, isChecked: flag);
        },
      ),
    );
  }

  // 商品图片
  _getGoodsImg() {
    return Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1)
      ),
      child: Image.network(cartInfoModel.image),
    );
  }

  // 商品名称
  _getGoodsName() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      alignment: Alignment.centerLeft,
      child: Text(
        cartInfoModel.goodsName,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(28)
        ),
      ),
    );
  }

  // 计数组件
  _getCounter(context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(15, 6, 15, 0),
      child: Container(
        width: ScreenUtil().setWidth(155),
        height: ScreenUtil().setHeight(50),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1)
        ),
        child: Row(
          children: [
            Container(
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.black12, width: 1)
                )
              ),
              child: InkWell(
                child: Icon(
                  Icons.remove,
                  color: Colors.black38,
                  size: 15,
                ),
                onTap: () {
                  if(cartInfoModel.count > 1) {
                    Provide.value<CartProvide>(context).removeCount(cartInfoModel.goodsId);
                  } else {
                    Toast.show(
                      '该商品不能减少了哦~',
                      context,
                      gravity: Toast.CENTER,
                    );
                  }
                },
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
              alignment: Alignment.center,
              child: Text(
                cartInfoModel.count.toString(),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.black12, width: 1)
                )
              ),
              child: InkWell(
                child: Icon(
                  Icons.add,
                  color: Colors.black38,
                  size: 15,
                ),
                onTap: () {
                  Provide.value<CartProvide>(context).addCount(cartInfoModel.goodsId);
                },
              ),
            ),
          ],
        )
      )
    );
  }

  // 最右侧组件
  _getRightWidget(context) {
    return Container(
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(150),
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Text('￥${cartInfoModel.price.toString()}'),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: InkWell(
              child: Icon(
                Icons.delete_outline,
                color: Colors.grey),
              onTap: () {
                Provide.value<CartProvide>(context).delete(cartInfoModel.goodsId);
              },
            ),
          )
        ],
      ),
    );
  }
}

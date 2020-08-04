import 'package:flutter/material.dart';
import 'package:flutter_shop/api/model/cartInfo.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';
import './views/cell.dart';
import './views/total_bottom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 第一次进来获取购物车数据
    _getCartInfo(context);
    return Scaffold(
      appBar: AppBar(title: Text('购物车')),
      body: Provide<CartProvide>(
        builder: (context, child, cartProvide) {
          List<CartInfoModel> cartModelsList = cartProvide.cartInfoModelsArr;
          return Stack(
            children: [
              Container(
                child: ListView.builder(
                  itemCount: cartModelsList.length,
                  itemBuilder: (context, index) {
                    return CartCell(cartModelsList[index]);
                  }
                )
              ),
              Positioned(
                bottom: 0,
                child: CartTotalBottom(),
              )
            ],
          );
        }
      ),
    );
  }

  _getCartInfo(context) async {
    await Provide.value<CartProvide>(context).getCartInfoModelsArray();
    return 'end';
  }
}



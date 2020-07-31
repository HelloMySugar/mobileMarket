import 'package:flutter/material.dart';
import '../api/model/detail.dart';
import '../api/request.dart';

class DetailInfoProvide with ChangeNotifier {
  DetailModal goodsInfo;
  bool tabIsLeft = true;

  // tabBar切换方法
  changeTabBarLeft(bool isClickedLeft) {
    tabIsLeft = isClickedLeft;
    notifyListeners();
  }

  // 从后台获取商品详情数据
  getGoodsInfo(String id) async {
    var postData = {
      'goodId': id
    };
    await requestPost(GoodsDetail, postData: postData).then((value) {
      goodsInfo = DetailModal.fromJson(value);
      notifyListeners();
    });
  }
}

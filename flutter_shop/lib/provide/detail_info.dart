import 'package:flutter/material.dart';
import '../api/model/detail.dart';
import '../api/request.dart';

class DetailInfoProvide with ChangeNotifier {
  DetailModal goodsInfo = null;
  // 从后台获取商品详情数据
  getGoodsInfo(String id) {
    var postData = {
      'goodId': id
    };
    requestPost(GoodsDetail, postData: postData).then((value) {
      goodsInfo = DetailModal.fromJson(value);
      notifyListeners();
    });
  }
}

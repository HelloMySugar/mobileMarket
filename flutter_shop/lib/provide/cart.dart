import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../api/model/cartInfo.dart';

class CartProvide with ChangeNotifier {
  static String StoreCartKey = 'StoreToCart';
  List<CartInfoModel> cartInfoModelsArr = [];
  int goodsTotalCount = 0;
  double goodsTotalPrice = 0.00;
  bool isAllChoose = false;

  _initValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var cartDataStr = preferences.getString(StoreCartKey);
    var temp = cartDataStr == null ? [] : json.decode(cartDataStr);
    return (temp as List).cast();
  }
  getCartInfoModelsArray() async {
    var cartDataList = await _initValue();
    _save(cartDataList);
  }
  addCount(goodsId, { goodsName, price, image }) async {
    var cartDataList = await _initValue();
    bool find = false;
    for(var i = 0; i < cartDataList.length; i ++) {
      var object = cartDataList[i];
      if(object['goodsId'] == goodsId) {
        object['count'] = object['count'] + 1;
        find = true;
        break;
      }
    }
    if (!find) {
      cartDataList.add({
        'goodsId': goodsId,
        'goodsName': goodsName,
        'price': price,
        'image': image,
        'count': 1,
        'isChecked': true
      });
    }
    _save(cartDataList);
  }
  removeCount(goodsId) async {
    var cartDataList = await _initValue();
    bool find = false;
    for(var i = 0; i < cartDataList.length; i ++) {
      var object = cartDataList[i];
      if(object['goodsId'] == goodsId) {
        if(object['count'] > 1) {
          find = true;
          object['count'] = object['count'] - 1;
        }else {
          print('已经是1了，不能减少了');
        }
        break;
      }
    }
    if(find) {
      _save(cartDataList);
    }
  }
  update(goodsId, { count, goodsName, price, image, isChecked }) async {
    var cartDataList = await _initValue();
    bool find = false;
    for(var i = 0; i < cartDataList.length; i ++) {
      var object = cartDataList[i];
      if(object['goodsId'] == goodsId) {
        if (count != null) object['count'] = count;
        if (goodsName != null) object['goodsName'] = goodsName;
        if (price != null) object['price'] = price;
        if (image != null) object['image'] = image;
        if (isChecked != null) object['isChecked'] = isChecked;
        find = true;
        print(object['isChecked']);
        break;
      }
    }
    if (find) {
      _save(cartDataList);
    }
  }
  delete(goodsId) async {
    var cartDataList = await _initValue();
    int findIndex = -1;
    for(var i = 0; i < cartDataList.length; i ++) {
      var object = cartDataList[i];
      if(object['goodsId'] == goodsId) {
        findIndex = i;
        break;
      }
    }
    if(findIndex > -1) {
      cartDataList.removeAt(findIndex);
      _save(cartDataList);
    }
  }
  _save(cartDataList) async {
    print(cartDataList);
    cartInfoModelsArr.clear();
    goodsTotalCount = 0;
    goodsTotalPrice = 0.00;
    isAllChoose = false;
    if(cartDataList != null && cartDataList.length > 0) {
      int isCheckedTotalCount = 0;
      cartDataList.forEach((item) {
        cartInfoModelsArr.add(CartInfoModel.fromJson(item));
        if (item['isChecked']) {
          goodsTotalCount = goodsTotalCount + item['count'];
          goodsTotalPrice = goodsTotalPrice + item['count'] * item['price'];
          isCheckedTotalCount ++;
        }
      });
      isAllChoose = isCheckedTotalCount == cartDataList.length;
    }
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(StoreCartKey, json.encode(cartDataList).toString());
    notifyListeners();
  }
  chooseAllOrNot(flag) async {
    var cartDataList = await _initValue();
    for(var i = 0; i < cartDataList.length; i ++) {
      var object = cartDataList[i];
      object['isChecked'] = flag;
    }
    _save(cartDataList);
  }
  clearAll() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(StoreCartKey);
    cartInfoModelsArr.clear();
    goodsTotalCount = 0;
    goodsTotalPrice = 0.00;
    notifyListeners();
  }
}

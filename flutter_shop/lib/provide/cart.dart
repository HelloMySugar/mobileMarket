import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvide with ChangeNotifier {
  static String StoreCartKey = 'StoreToCart';
  List cartDataList = [];
  _initValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var cartDataStr = preferences.getString(StoreCartKey);
    var temp = cartDataStr == null ? [] : json.decode(cartDataStr);
    cartDataList = (temp as List).cast();
  }
  addToCart(goodsId, goodsName, price, image) async {
    await _initValue();
    bool find = false;
    for(var i = 0; i < cartDataList.length; i ++) {
      var object = cartDataList[i];
      if(object['goodsId'] == goodsId) {
        object['count'] = object['count'] + 1;
        object['goodsName'] = object['goodsName'];
        object['price'] = object['price'];
        object['image'] = object['image'];
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
        'count': 1
      });
    }
    _save();
  }
  remove(goodsId) async {
    await _initValue();
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
      _save();
    }
  }
  _save() async {
    print(cartDataList);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(StoreCartKey, json.encode(cartDataList).toString());
    notifyListeners();
  }
  clearAll() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(StoreCartKey);
  }
}

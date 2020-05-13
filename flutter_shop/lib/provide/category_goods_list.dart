import 'package:flutter/material.dart';
import '../api/model/categoryGoodsList.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryGoodsObject> goodsList = [];

  getCategoryGoodsList(List<CategoryGoodsObject> list) {
    goodsList = list;
    notifyListeners();
  }
}

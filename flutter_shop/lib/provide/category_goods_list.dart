import 'package:flutter/material.dart';
import '../api/model/categoryGoodsList.dart';
import '../api/request.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryGoodsObject> goodsList = [];

  getCategoryGoodsList(List<CategoryGoodsObject> list) {
    goodsList.addAll(list);
    notifyListeners();
  }

  clearCategoryGoodsList() {
    goodsList.clear();
    notifyListeners();
  }

  // 获取大类全部商品列表
  // categoryId:大类ID，字符串类型
  // categorySubId : 子类ID，字符串类型，如果没有可以填写空字符串，例如''
  // page: 分页的页数，int类型
  getBigCateGoodsList(categoryId) async {
    var postData = {
      'categoryId': categoryId,
      'categorySubId': '', // 每次切换大类，都是不传默认为全部
      'page': 1 // 每次切换大类，都是传1为第一页
    };
    await requestPost(CategoryMallGoods, postData: postData).then((value) {
      CategoryGoodsListObject categoryGoodsListObject =
      CategoryGoodsListObject.fromJson(value);
      var tmpData = categoryGoodsListObject.data != null
        ? categoryGoodsListObject.data
        : List<CategoryGoodsObject>();
      goodsList.clear();
      goodsList.addAll(tmpData);
      notifyListeners();
    });
  }
}

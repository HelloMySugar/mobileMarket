import 'package:flutter/material.dart';
import '../api/model/category.dart';

class SubCategory with ChangeNotifier {
  List subCategoryList = [];

  setSubCategoryList(list) {
    subCategoryList = list;
    // 手动加入'全部'类目（服务器并未返回）
    SubCategoryObject allSubCategoryObject = SubCategoryObject(
      mallSubId: '000',
      mallCategoryId: '000',
      mallSubName: '全部',
      comments: 'null',
    );
    subCategoryList.insert(0, allSubCategoryObject);
    notifyListeners();
  }
}

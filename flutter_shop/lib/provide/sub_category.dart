import 'package:flutter/material.dart';
import '../api/model/category.dart';

class SubCategory with ChangeNotifier {
  List subCategoryList = [];
  int childIndex = 0; // 右边子类默认选择'全部', 子类索引
  String categoryId = ''; //大类id
  String categorySubId = ''; // 子类id
  int page = 1; // 加载的页数

  // 点击大类时，更换右边商品小分类横向滑动的列表
  setSubCategoryList(list, categoryIdStr) {
    childIndex = 0;
    categoryId = categoryIdStr;
    categorySubId = '';
    page = 1;

    var newList = [];
    // 手动加入'全部'类目（服务器并未返回）
    SubCategoryObject allSubCategoryObject = SubCategoryObject(
      mallSubId: '',
      mallCategoryId: '',
      mallSubName: '全部',
      comments: 'null',
    );
    newList.add(allSubCategoryObject);
    newList.addAll(list);
    subCategoryList = newList;
    notifyListeners();
  }

  // 改变子类索引
  changeChildIndex(index, categorySubIdStr) {
    childIndex = index;
    categorySubId = categorySubIdStr;
    page = 1;
    notifyListeners();
  }

  setPageInit() {
    page = 1;
  }

  addPage() {
    page ++;
  }
}

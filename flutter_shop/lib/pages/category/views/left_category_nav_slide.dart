import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import '../../../api/request.dart';
import '../../../api/model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provide/sub_category.dart';
import 'package:provide/provide.dart';
import '../../../api/model/categoryGoodsList.dart';

// 左侧大类导航
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List categoryLists =
      []; // 注意：一定要赋值，不然categoryLists为空，ListView中使用categoryLists.length为null类型时会报错

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 请求数据
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: categoryLists.length,
        itemBuilder: (context, index) =>
            _leftCategoryItem(categoryLists[index]),
      ),
    );
  }

  // 请求左侧分类
  _getCategory() async {
    await requestPost(Category).then((value) {
      CategoryListObject categoryListObject =
          CategoryListObject.fromJson(value);
      setState(() {
        this.categoryLists = categoryListObject.data;
        _clickCategoryItem(this.categoryLists[0]); // 默认选择第一个分类
      });
    });
  }

  // 点击分类item
  _clickCategoryItem(CategoryObject categoryObject) {
    var subList = categoryObject.bxMallSubDto;
    Provide.value<SubCategory>(context)
        .setSubCategoryList(subList, categoryObject.mallCategoryId);
    // 获取右边商品列表
    Provide.value<CategoryGoodsListProvide>(context).clearCategoryGoodsList();
    _getGoodsList(categoryObject.mallCategoryId);
  }

  // 获取商品列表
  // categoryId:大类ID，字符串类型
  // categorySubId : 子类ID，字符串类型，如果没有可以填写空字符串，例如''
  // page: 分页的页数，int类型
  _getGoodsList(categoryId) async {
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
      Provide.value<CategoryGoodsListProvide>(context)
          .getCategoryGoodsList(tmpData);
    });
  }

  Widget _leftCategoryItem(CategoryObject categoryObject) {
    return InkWell(
      onTap: () {
        _clickCategoryItem(categoryObject);
      },
      child: Provide<SubCategory>(
        builder: (context, child, subCategory) {
          return Container(
            height: ScreenUtil().setHeight(100),
            padding: EdgeInsets.only(left: 10, top: 15),
            decoration: BoxDecoration(
              color: subCategory.categoryId == categoryObject.mallCategoryId
                ? Color.fromRGBO(240, 240, 240, 1.0)
                : Colors.white,
              border:
              Border(bottom: BorderSide(width: 1, color: Colors.black12))),
            child: Text(
              categoryObject.mallCategoryName,
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            ),
          );
        },
      )
    );
  }
}

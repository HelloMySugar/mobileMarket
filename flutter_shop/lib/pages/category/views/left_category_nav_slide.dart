import 'package:flutter/material.dart';
import '../../../api/request.dart';
import '../../../api/model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provide/sub_category.dart';
import 'package:provide/provide.dart';

// 左侧大类导航
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List categoryLists = []; // 注意：一定要赋值，不然categoryLists为空，ListView中使用categoryLists.length为null类型时会报错
  CategoryObject currentCateObject; // 当前选中的分类对象

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
      width: ScreenUtil().setWidth(200),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: ListView.builder(
        itemCount: categoryLists.length,
        itemBuilder: (context, index) => _leftCategoryItem(categoryLists[index]),
      ),
    );
  }

  // 请求左侧分类
  _getCategory() async {
    await requestPost(Category).then((value) {
      CategoryListObject categoryListObject = CategoryListObject.fromJson(value);
      setState(() {
        this.categoryLists = categoryListObject.data;
        _clickCategoryItem(this.categoryLists[0]); // 默认选择第一个分类
      });
    });
  }

  // 点击分类item
  _clickCategoryItem(CategoryObject categoryObject) {
    var subList = categoryObject.bxMallSubDto;
    Provide.value<SubCategory>(context).setSubCategoryList(subList);
    setState(() {
      currentCateObject = categoryObject;
    });
  }

  Widget _leftCategoryItem(CategoryObject categoryObject) {
    return InkWell(
      onTap: () {
        _clickCategoryItem(categoryObject);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 15),
        decoration: BoxDecoration(
          color: currentCateObject == categoryObject ? Color.fromRGBO(240, 240, 240, 1.0) : Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12
            )
          )
        ),
        child: Text(
          categoryObject.mallCategoryName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(30)
          ),
        ),
      ),
    );
  }
}

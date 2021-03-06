import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../../provide/tabbar_index.dart';
import '../../../provide/sub_category.dart';
import '../../../provide/category_goods_list.dart';
import '../../../api/model/category.dart';

// 顶部导航
class CustomGridView extends StatelessWidget {
  List gridList;
  CustomGridView({ Key key, @required this.gridList}): super(key: key);

  @override
  Widget build(BuildContext context) {
    if(gridList.length > 10) gridList = gridList.sublist(0, 10);

    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
        crossAxisCount: 5,
        padding: EdgeInsets.all(5),
        children: gridList.map((e) {
          return _getGridItemView(context, e);
        }).toList(),
      )
    );
  }

  Widget _getGridItemView(context, object) {
    return InkWell( // 接受单击事件的控件
      onTap: () {
        var subList = object['bxMallSubDto'];
        var subObjectList = [];
        subList.forEach((item) {
          subObjectList.add(SubCategoryObject.fromJson(item));
        });
        Provide.value<SubCategory>(context).setSubCategoryList(subObjectList, object['mallCategoryId']);
        Provide.value<CategoryGoodsListProvide>(context).getBigCateGoodsList(object['mallCategoryId']);
        Provide.value<TabBarIndexProvide>(context).changeTabBarIndex(1);
      },
      child: Column(
        children: [
          Image.network(object['image'], width: ScreenUtil().setWidth(95), height: ScreenUtil().setWidth(95)),
          Text(object['mallCategoryName'])
        ],
      ),
    );
  }
}

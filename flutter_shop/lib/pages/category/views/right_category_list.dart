import 'package:flutter/material.dart';
import '../../../api/model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provide/sub_category.dart';
import 'package:provide/provide.dart';
import '../../../api/request.dart';

// 右边列表数据展示
class RightCategoryList extends StatefulWidget {
  @override
  _RightCategoryListState createState() => _RightCategoryListState();
}

class _RightCategoryListState extends State<RightCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750-200),
      child: Column(
        children: [
          Provide<SubCategory>(
            builder: (context, child, subCategory) {
              return Container(
                height: ScreenUtil().setHeight(80),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: subCategory.subCategoryList.length,
                  itemBuilder: (context, index) {
                    return _rightSlideItem(subCategory.subCategoryList[index]);
                  }
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black12
                    )
                  )
                ),
              );
            },
          ),
          CategoryGoodsList()
        ],
      ),
    );
  }

  Widget _rightSlideItem(SubCategoryObject subCategoryObject) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          subCategoryObject.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(30)
          ),
        ),
      ),
    );
  }
}

// 右边商品列表
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _getGoodsList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('商品列表'),
    );
  }

  // 获取商品列表
  // categoryId:大类ID，字符串类型
  // categorySubId : 子类ID，字符串类型，如果没有可以填写空字符串，例如''
  // page: 分页的页数，int类型
//  _getGoodsList() async {
//    var postData = {
//      'categoryId': '4',
//      'categorySubId': '',
//      'page': 1
//    };
//    await requestPost(CategoryMallGoods, postData: postData).then((value){
//      print('分类商品列表：'  + value);
//    });
//  }
}


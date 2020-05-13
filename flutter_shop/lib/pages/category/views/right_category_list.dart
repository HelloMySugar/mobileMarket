import 'package:flutter/material.dart';
import '../../../api/model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provide/sub_category.dart';
import '../../../provide/category_goods_list.dart';
import 'package:provide/provide.dart';
import '../../../api/request.dart';
import '../../../api/model/categoryGoodsList.dart';

// 右边列表数据展示
class RightCategoryList extends StatefulWidget {
  @override
  _RightCategoryListState createState() => _RightCategoryListState();
}

class _RightCategoryListState extends State<RightCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750 - 180),
      child: SingleChildScrollView(
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
                        return _rightSlideItem(index,
                            subCategory.subCategoryList[index]);
                      }),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.black12))),
                );
              },
            ),
            CategoryGoodsList(),
          ],
        ),
      ),
    );
  }

  Widget _rightSlideItem(int index, SubCategoryObject subCategoryObject) {
    bool isClick = false;
    isClick = index == Provide.value<SubCategory>(context).childIndex ? true : false;
    return InkWell(
      onTap: () {
        Provide.value<SubCategory>(context).changeChildIndex(index);
        _getGoodsList(subCategoryObject.mallSubId);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          subCategoryObject.mallSubName,
          style: TextStyle(
            color: isClick ? Colors.pink : Colors.black,
            fontSize: ScreenUtil().setSp(30)
          ),
        ),
      )
    );
  }

  // 获取商品列表
  // categorySubId : 子类ID，字符串类型，如果没有可以填写空字符串，例如''
  // page: 分页的页数，int类型
  _getGoodsList(categorySubId) async {
    var postData = {
      'categoryId': Provide.value<SubCategory>(context).categoryId,
      'categorySubId': categorySubId,
      'page': 1
    };
    await requestPost(CategoryMallGoods, postData: postData).then((value) {
      CategoryGoodsListObject categoryGoodsListObject = CategoryGoodsListObject.fromJson(value);
      Provide.value<CategoryGoodsListProvide>(context).getCategoryGoodsList(categoryGoodsListObject.data);
    });
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(750 - 180),
//    iPhone6的界面布局是：屏幕是4.7英寸的，设计稿的大小为750x1334px。
//    ☆  状态栏(status bar)：就是电量条，其高度为：40px；
//    ☆  导航栏(navigation)：就是顶部条，其高度为：88px；
//    ☆  主菜单栏(submenu，tab)：就是标签栏，底部条，其高度为：98px；
//    ☆  内容区域(content)：就是屏幕中间的区域，其高度为：1334px-40px-88px-98px=1108px
        height: ScreenUtil().setHeight(1108 - 80 - 42), // 42为补差，可能实际底部条实际偏高些
        child: Provide<CategoryGoodsListProvide>(
            builder: (context, child, cateGoodsListProvide) {
          return ListView.builder(
              itemCount: cateGoodsListProvide.goodsList.length,
              itemBuilder: (context, index) {
                return _goodsItemWidget(cateGoodsListProvide.goodsList[index]);
              });
        }));
  }

  Widget _goodsItemWidget(CategoryGoodsObject item) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        width: ScreenUtil().setWidth(750 - 180),
        height: ScreenUtil().setHeight(180),
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1))),
        child: Row(
          children: [
            Image.network(item.image, width: ScreenUtil().setWidth(150)),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, right: 5),
              width: ScreenUtil().setWidth(750 - 180 - 150 - 10 - 5),
              child: Column(
                children: [
                  Container(
                      width: ScreenUtil().setWidth(750 - 180 - 150 - 10),
                      child: Text(item.goodsName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left)),
                  Container(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        Text('价格:￥${item.presentPrice}',
                            style: TextStyle(color: Colors.pink)),
                        Text('￥${item.oriPrice}',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 12)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

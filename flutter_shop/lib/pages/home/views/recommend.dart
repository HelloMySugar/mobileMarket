import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routers/application.dart';

class Recommend extends StatelessWidget {
  List recommendList;

  Recommend({ this.recommendList });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(415),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _titleWidget(),
          Container(
            height: ScreenUtil().setHeight(350),
            // 方法一
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: recommendList.map((e) {
                return _itemWidget(context, e);
              }).toList()
            ),
            // 方法二
//            child: ListView.builder(
//              scrollDirection: Axis.horizontal,
//              itemCount: recommendList.length,
//              itemBuilder: (BuildContext context, int index) {
//                return _itemWidget(context, recommendList[index]);
//              }
//            ),
          )
          // 方法三
//          SingleChildScrollView(
//            scrollDirection: Axis.horizontal,
//            child: Row(
//              children: recommendList.map((e) {
//                return _itemWidget(context, e);
//              }).toList(),
//            ),
//          )
        ],
      ),
    );
  }

  // 推荐title
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: Text('商品推荐', style: TextStyle(color: Colors.pink))
    );
  }

  // 每个商品控件
  Widget _itemWidget(context, object) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '/detail?id=${object['goodsId']}');
      },
      child: Container(
        height: ScreenUtil().setHeight(350),
        width: ScreenUtil().setWidth(750/3),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child: Column(
          children: [
            Image.network(object['image']),
            Text('￥${object['mallPrice']}'),
            Text(
              '￥${object['price']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                fontSize: 12
              )
            )
          ],
        )
      ),
    );
  }
}

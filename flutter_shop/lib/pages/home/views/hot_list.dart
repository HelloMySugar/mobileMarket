import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotList extends StatefulWidget {
  List hotGoodsList;
  HotList({ Key key, @required this.hotGoodsList }): super(key: key);

  @override
  _HotListState createState() => _HotListState();
}

class _HotListState extends State<HotList> {
  Widget hotTitleWidget = Container(
    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
    alignment: Alignment.center,
    child: Text('火爆专区'),
    color: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            hotTitleWidget,
            Container(
              color: Colors.white,
              //第一种方法
              child: Wrap(
                spacing: 0, // 间距
                children: widget.hotGoodsList.map((e) => _hotItemWidget(e)).toList()
              ),
              // 第二种方法（注：但是好像有问题，滑动到最下面，再往上滑滑不动不生效）
//              child: GridView.count(
//                shrinkWrap: true, // 自动页面排版往下挤，布局往下，默认为false
//                crossAxisCount: 2,
//                mainAxisSpacing: 0,
//                crossAxisSpacing: 0,
//                children: widget.hotGoodsList.map((e) => _hotItemWidget(e)).toList(),
//              ),
            )
          ]
        )
    );
  }

  Widget _hotItemWidget(item) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        width: ScreenUtil().setWidth(750/2),
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Image.network(item['image'], width: ScreenUtil().setWidth(360)),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
              child: Text(
                item['name'],
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color:Colors.pink,
                  fontSize: ScreenUtil().setSp(26)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    '￥${item['mallPrice']}'
                  ),
                  Text(
                    '￥${item['price']}',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 12
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


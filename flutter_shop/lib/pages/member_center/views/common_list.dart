import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonList extends StatelessWidget {
  final List itemList;
  CommonList(this.itemList);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(110*itemList.length),
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return _getItem(itemList[index]);
        }
      ),
    );
  }

  _getItem(object) {
    return Container(
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1
          )
        )
      ),
      child: ListTile(
        leading: Icon(object['icon']),
        title: Text(object['name']),
        trailing: Icon(Icons.navigate_next),
      ),
    );
  }
}

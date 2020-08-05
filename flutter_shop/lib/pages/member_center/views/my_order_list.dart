import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                  width: 1
                )
              )
            ),
            child: ListTile(
              leading: Icon(
                Icons.assignment,
              ),
              title: Text(
                '我的订单'
              ),
              trailing: Icon(
                Icons.navigate_next,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(750/4),
                  child: Column(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.black38,
                        size: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          '待付款'
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(750/4),
                  child: Column(
                    children: [
                      Icon(
                        Icons.history,
                        color: Colors.black38,
                        size: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          '待发货'
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(750/4),
                  child: Column(
                    children: [
                      Icon(
                        Icons.time_to_leave,
                        color: Colors.black38,
                        size: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          '待收货'
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(750/4),
                  child: Column(
                    children: [
                      Icon(
                        Icons.rate_review,
                        color: Colors.black38,
                        size: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          '待评价'
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

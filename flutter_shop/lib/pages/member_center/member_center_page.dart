import 'package:flutter/material.dart';
import './views/top_header.dart';
import './views/my_order_list.dart';
import './views/common_list.dart';

class MemberCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('会员中心')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(),
            MyOrderList(),
            CommonList([
              {'name': '领取优惠券', 'icon': Icons.local_florist},
              {'name': '已领取优惠劵', 'icon': Icons.perm_media},
              {'name': '地址管理', 'icon': Icons.map}
              ]),
            CommonList([
              {'name': '客服电话', 'icon': Icons.sentiment_very_satisfied},
              {'name': '关于我们', 'icon': Icons.accessibility},
            ])
          ],
        ),
      ),
    );
  }
}

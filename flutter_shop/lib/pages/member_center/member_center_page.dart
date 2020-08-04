import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './views/top_header.dart';

class MemberCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('会员中心')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader()
          ],
        ),
      ),
    );
  }
}

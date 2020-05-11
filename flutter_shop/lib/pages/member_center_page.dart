import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class MemberCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('会员中心')),
      body: Center(
        child: Provide<Counter>(
          builder: (content, child, counter) {
            return Text(
              '${counter.value}'
            );
          }
        ),
      ),
    );
  }
}

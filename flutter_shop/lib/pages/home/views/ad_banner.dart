import 'package:flutter/material.dart';

// 广告区域
class AdBanner extends StatelessWidget {
  Map adObject;
  AdBanner({ @required this.adObject });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Image.network(this.adObject['PICTURE_ADDRESS']),
    );
  }
}

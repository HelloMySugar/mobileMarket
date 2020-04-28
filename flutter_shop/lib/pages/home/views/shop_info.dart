import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopInfo extends StatelessWidget {
  Map shopObject;

  ShopInfo({ this.shopObject });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          _launchOpenUrl();
        },
        child: Image.network(this.shopObject['leaderImage']),
      ),
    );
  }

  _launchOpenUrl() async {
    String url = 'tel:' + this.shopObject['leaderPhone'];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url, please check!';
    }
  }
}

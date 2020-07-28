import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/detail_info.dart';

class DetailPage extends StatelessWidget {
  String goodsId;
  DetailPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    _getDetailInfo(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('商品详情'),
        ),
        body: FutureBuilder(
          future: _getDetailInfo(context),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Container(
                child: Column(
                  children: [

                  ],
                ),
              );
            }else{
              return Text('暂无数据');
            }
          },
        ),
      )
    );
  }
  Future _getDetailInfo (BuildContext context) async {
    await Provide.value<DetailInfoProvide>(context).getGoodsInfo(goodsId);
    return '完成加载';
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/api/model/detail.dart';
import 'package:provide/provide.dart';
import '../../../provide/detail_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailTopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailInfoProvide>(
      builder: (context, child, detailInfoProvide) {
        DetailModal detailModal = Provide.value<DetailInfoProvide>(context).goodsInfo;
        if(detailModal == null) {
          return Center(
            child: Text('加载中'),
          );
        } else {
          var goodInfo = detailModal.goodInfo;
          return Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              children: [
                Image.network(goodInfo.image1,
                  width: ScreenUtil().setWidth(730),
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  width: ScreenUtil().setWidth(750),
                  child: Text(goodInfo.goodsName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 5),
                  width: ScreenUtil().setWidth(750),
                  child: Text('编号: ${goodInfo.goodsSerialNumber}',
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 8),
                  child: Row(
                    children: [
                      Text('￥ ${goodInfo.oriPrice.toString()}',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text('市场价：',
                          style: TextStyle(
                            color: Colors.black45
                          ),
                        )
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text('￥ ${goodInfo.presentPrice.toString()}',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough
                          ),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routers/application.dart';

// 首页轮播组件
class SwiperDiy extends StatelessWidget {
  List swiperDataList;

  SwiperDiy({ @required this.swiperDataList });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        onTap: (index) {
          Application.router.navigateTo(context, '/detail?id=${swiperDataList[index]['goodsId']}');
        },
        itemCount: swiperDataList.length,
        itemBuilder: (context, index) {
          return Image.network(
            swiperDataList[index]['image'],
            fit: BoxFit.cover,
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}


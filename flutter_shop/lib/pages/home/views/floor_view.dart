import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 楼层（每层Row布局不同）控件，不同Row布局不同
class FloorView extends StatelessWidget {
  Map headerObject;
  List floorList;
  FloorView({ Key key, @required this.headerObject, @required this.floorList}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            color: Color.fromRGBO(239, 239, 239, 1.0),
            child: InkWell(
              onTap: () {

              },
              child: Image.network(
                headerObject['PICTURE_ADDRESS'],
              )
            )
          ),
          Row(
            children: [
              Container(
                width: ScreenUtil().setWidth(750/2),
                child: FloorItemImage(object: floorList[0])
              ),
              Container(
                width: ScreenUtil().setWidth(750/2),
                child: Column(
                  children: [
                    FloorItemImage(object: floorList[1]),
                    FloorItemImage(object: floorList[2]),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: ScreenUtil().setWidth(750/2),
                child: FloorItemImage(object: floorList[3]),
              ),
              Container(
                width: ScreenUtil().setWidth(750/2),
                child: FloorItemImage(object: floorList[4])
              )
            ],
          )
        ],
      ),
    );
  }
}

class FloorItemImage extends StatelessWidget {
  Map object;

  FloorItemImage({ @required this.object });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // {goodsId: a98f899b1f944e71bee6880f9ab1b903}
      },
      child: Image.network(object['image'])
    );
  }
}

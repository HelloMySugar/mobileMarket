import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(400),
      alignment: Alignment.center,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setWidth(400),
            child: Container(
              child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596544237540&di=cb16068448f389bd42f840c3d6eeccec&imgtype=0&src=http%3A%2F%2Fpic38.nipic.com%2F20140211%2F13857113_164850282173_2.png',
                fit: BoxFit.cover,
              )
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setWidth(400),
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  width: ScreenUtil().setWidth(200),
                  padding: EdgeInsets.only(top: 3),
                  child: ClipOval(
                    child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596543199042&di=e1db7f482d2b2fbf3d12b84c844eb1b8&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201801%2F14%2F20180114135233_JFtPw.jpeg')
                  )
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'This is Root',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(40)
                    ),
                  ),
                )
              ]
            ),
          )
        ],
      )
    );
  }
}

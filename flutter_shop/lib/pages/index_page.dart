import 'package:flutter/material.dart'; // Google推出的设计语言
import 'package:flutter/cupertino.dart'; // iOS风格
import 'home/home_page.dart';
import 'category/category_page.dart';
import 'cart/cart_page.dart';
import 'member_center/member_center_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provide/tabbar_index.dart';
import 'package:provide/provide.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<BottomNavigationBarItem> tabBarList;
  List<Widget> pagesList;

  @override
  void initState() {
    super.initState();

    tabBarList = [
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home
        ),
        title: Text('首页')
      ),
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.search
        ),
        title: Text('分类')
      ),
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.shopping_cart
        ),
        title: Text('购物车')
      ),
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.profile_circled
        ),
        title: Text('会员中心')
      )
    ];

    pagesList = [
      HomePage(),
      CategoryPage(),
      CartPage(),
      MemberCenterPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

//    print('设备像素密度${ScreenUtil.pixelRatio}');
//    print('设备的高${ScreenUtil.screenHeight}');
//    print('设备的宽${ScreenUtil.screenWidth}');

    return Provide<TabBarIndexProvide>(
      builder: (context, child, tabBarIndexProvide) {
        int currentIndex = tabBarIndexProvide.currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0), // Color.fromRGBO(239, 239, 239, 1.0)
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // 大于3个item使用
            currentIndex: currentIndex,
            items: tabBarList,
            onTap: (index) {
              Provide.value<TabBarIndexProvide>(context).changeTabBarIndex(index);
            },
          ),
          body: IndexedStack( // 保持页面状态控件
            index: currentIndex,
            children: pagesList
          )
        );
      },
    );
  }
}


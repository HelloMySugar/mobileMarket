import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/tabbar_index.dart';
import './provide/sub_category.dart';
import './provide/category_goods_list.dart';
import './provide/detail_info.dart';
import './provide/cart.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';

void main() {
  var tabBarIndexProvide = TabBarIndexProvide();
  var subCategory = SubCategory();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var detailInfoProvide = DetailInfoProvide();
  var cartProvide = CartProvide();

  // 监听注入
  var providers = Providers();
  providers..provide(Provider<TabBarIndexProvide>.value(tabBarIndexProvide));
  providers..provide(Provider<SubCategory>.value(subCategory));
  providers..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide));
  providers..provide(Provider<DetailInfoProvide>.value(detailInfoProvide));
  providers..provide(Provider<CartProvide>.value(cartProvide));

  runApp(ProviderNode(
    child: MyApp(),
    providers: providers,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink
        ),
        home: IndexPage(),
      ),
    );
  }
}

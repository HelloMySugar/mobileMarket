import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/sub_category.dart';

void main() {
  var counter = Counter();
  var subCategory = SubCategory();

  // 监听注入
  var providers = Providers();
  providers..provide(Provider<Counter>.value(counter));
  providers..provide(Provider<SubCategory>.value(subCategory));

  runApp(ProviderNode(
    child: MyApp(),
    providers: providers,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink
        ),
        home: IndexPage(),
      ),
    );
  }
}

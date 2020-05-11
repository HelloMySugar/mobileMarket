import 'package:flutter/material.dart';
import 'views/left_category_nav_slide.dart';
import 'views/right_category_list.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: [
            LeftCategoryNav(),
            RightCategoryList()
          ],
        ),
      ),
    );
  }
}




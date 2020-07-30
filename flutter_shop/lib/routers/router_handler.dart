import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/detail/index_page.dart';

Handler detailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String goodsId = params['id'].first;
    return DetailPage(goodsId);
  }
);
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = '/';
  static String detailPage = '/detail';
  static void configRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> parmas) {
        print('Error Page!!!');
      }
    );
    router.define(detailPage, handler: detailHandler);
  }
}

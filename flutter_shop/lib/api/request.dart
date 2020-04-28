import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

// 基本地址
const BaseUrl = 'https://wxmini.baixingliangfan.cn/baixing';

// 商城首页信息
const HomePageContent = BaseUrl + '/wxmini/homePageContent';

// 商城首页火爆专区
const HomePageHotBlock = BaseUrl + '/wxmini/homePageBelowConten';


// 获取数据
Future requestPost(url, { postData }) async  // 参数加{}表示为可选参数
{
  try {
    print('开始获取数据');
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded').toString();

    Response response;
    if(postData != null) {
      response = await dio.post(url, data: postData);
    } else {
      response = await dio.post(url);
    }
    if (response.statusCode == 200) {
      var result = json.decode(response.data.toString());
      print(result['data']);
      return result['data'];
    } else {
      throw Exception('接口数据异常');
    }
  } catch (e) {
    return print('接口报错 ==========> ${e.toString()}');
  }
}

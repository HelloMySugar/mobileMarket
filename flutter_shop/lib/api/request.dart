import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

// 基本地址
const BaseUrl = 'https://wxmini.baixingliangfan.cn/baixing';

// 商城首页信息
const HomePageContent = BaseUrl + '/wxmini/homePageContent';

// 商城首页火爆专区
const HomePageHotBlock = BaseUrl + '/wxmini/homePageBelowConten';

// 商品分类页数据
const Category = BaseUrl + '/wxmini/getCategory';

// 商品分类页中的商品列表
const CategoryMallGoods = BaseUrl + '/wxmini/getMallGoods';

// 商品详情
const GoodsDetail = BaseUrl + '/wxmini/getGoodDetailById';

// 获取数据
Future requestPost(url, { postData }) async  // 参数加{}表示为可选参数
{
  try {
    print('开始获取数据=====:${postData}');
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded').toString();

    // 为了Charles抓包使用
//    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//      (client) {
//      client.badCertificateCallback =
//        (X509Certificate cert, String host, int port) {
//        return Platform.isAndroid;
//      };
//      client.findProxy = (url) {
//        return 'PROXY 192.168.125.130:8888';// 本机IP
//      };
//    };
    //

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

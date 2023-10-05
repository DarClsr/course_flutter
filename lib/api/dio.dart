import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio initDio (){
  BaseOptions _baseOptions= BaseOptions(
    // 地址
    baseUrl: "http://eduboss.lagou.com",
    connectTimeout: Duration(milliseconds: 5000), //服务器超时时间
  );

  Dio dio=new Dio(_baseOptions);


  dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options,handler){
          print('请求之前进行拦截');
          return handler.next(options);
        },
        onResponse: (Response response,ResponseInterceptorHandler handler){
          print('响应之前进行拦截');
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler){
          print('报错');
          return handler.next(e);
        }


     )
  );

  return dio;
}
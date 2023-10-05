import 'package:courses/api/ad.dart';
import 'package:dio/dio.dart';
import 'dio.dart';


class API {
 late Dio _dio;

  API(){
    _dio=initDio();
  }


  AdApi get ad=> AdApi(_dio);

}
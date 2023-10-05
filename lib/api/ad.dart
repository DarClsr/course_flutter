import 'package:dio/dio.dart';

class AdApi {
  final Dio _dio;
  AdApi(this._dio);

  //广告列表

  Future<dynamic> adList({String spaceKeys = "999"}) async {
    Response res = await _dio
        .get('front/ad/getAllAds', queryParameters: {"spaceKeys": spaceKeys});
    print(res.data);
  }
}

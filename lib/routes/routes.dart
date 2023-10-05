import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routesHandler.dart';


class Routes {
  static FluroRouter? router;
  static void configRroutes(FluroRouter router){
    router.define('/', handler: IndexHandler);
    router.define('/login', handler: LoginHandler);
    router.define('/book_detail', handler: BookDetailHandler);
    router.notFoundHandler=NotFoundHandler;
  }

  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic>? params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params is Map) {
      int index = 0;
      for (var key in params!.keys) {
        print("$key");
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');

    path = path + query;
    return router!.navigateTo(context, path, transition:transition);
  }

}
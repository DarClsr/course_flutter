import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routesHandler.dart';


class Routes {
  static void configRroutes(FluroRouter router){
    router.define('/', handler: IndexHandler);
    router.define('/login', handler: LoginHandler);
    router.notFoundHandler=NotFoundHandler;
  }
}
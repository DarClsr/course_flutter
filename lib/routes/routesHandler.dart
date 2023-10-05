import 'package:courses/model/book.dart';
import 'package:courses/pages/bookDetail/bookDetail.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/index.dart';
import '../pages/login/login.dart';
import '../pages/not_found/not_found.dart';

var IndexHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return IndexPage();
});

var LoginHandler =
Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return LoginPage();
});


var BookDetailHandler =
Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  final Book book = context!.settings!.arguments as Book ;
  return BookDetail(book: book);
});


var NotFoundHandler =
Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return  UnknowPage();
});



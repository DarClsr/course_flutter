import 'package:courses/api/api.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';




class G {
  // 路由
  static FluroRouter? router;
  static final API api= API();
  static isDarkMode(BuildContext context) {
    var mode= Theme.of(context).brightness == Brightness.dark;
    return mode;
  }


}
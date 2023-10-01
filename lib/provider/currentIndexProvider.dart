import 'package:flutter/material.dart';


class CurrentIndexProvider with ChangeNotifier {
  int _current=0;

  int get current  => _current;

  void changeCurrent(int index){
     _current=index;
     notifyListeners();
  }
}
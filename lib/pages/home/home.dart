import 'package:courses/utils/global.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
              onPressed:(){
                G.router!.navigateTo(context,'/login');
              },
              child: Text("登陆页面")
          ),
          ElevatedButton(
              onPressed:(){
                G.router!.navigateTo(context,'/aaa');
              },
              child: Text("未知页面")
          )
        ],
      ),
    );
  }
}





import 'package:flutter/material.dart';


class UnknowPage extends StatefulWidget {
  const UnknowPage({super.key});

  @override
  State<UnknowPage> createState() => _UnknowPageState();
}

class _UnknowPageState extends State<UnknowPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/404.png'),
            SizedBox(
              height: 20,
            ),
            Text('您似乎来到了知识的荒原')
          ],
        )
      )
    );
  }
}





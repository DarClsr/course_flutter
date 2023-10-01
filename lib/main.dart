import 'package:courses/pages/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'utils/global.dart';
import 'package:provider/provider.dart';
import 'provider/currentIndexProvider.dart';
void main() {
  // 初始化路由
  FluroRouter router=new FluroRouter();
  Routes.configRroutes(router);
  G.router=router;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CurrentIndexProvider(),
        )
        // Provider<CurrentIndexProvider>(create: (_) => CurrentIndexProvider()),
      ],
      child:MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iwan课程',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:IndexPage() ,
      initialRoute: "/",
      onGenerateRoute: G.router!.generator,
    );
  }
}


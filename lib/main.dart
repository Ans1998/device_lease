import 'package:flutter/material.dart';

import './router/index.dart';

import './pages/navigat/index.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      locale: const Locale('zh'), // TextField光标不对准问题
      home: MyAppPages(),
      routes: Router.config(),
      // initialRoute: '/list',//初始化路由为namePage页面

    );
  }
}



import 'package:flutter/material.dart';

import './router/index.dart';

import './pages/navigat/index.dart';
import 'package:bot_toast/bot_toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit( child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      locale: const Locale('zh'), // TextField光标不对准问题
      home: MyAppPages(),
      navigatorObservers: [BotToastNavigatorObserver()], // 2.注册路由观察者
      routes: Router.config(),
      initialRoute: '/login',//初始化路由为namePage页面

    ));
  }
}



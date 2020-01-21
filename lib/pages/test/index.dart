import 'package:flutter/material.dart';
import './../../request/index.dart';
import 'package:bot_toast/bot_toast.dart';
class TestsPages extends StatefulWidget {
  TestsPages({Key key}) : super(key: key);

  @override
  _TestsPagesState createState() => _TestsPagesState();
}

class _TestsPagesState extends State<TestsPages> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("测试页面"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          }, 
          child: Row(
            children: <Widget>[
              Icon(Icons.arrow_back_ios),
              Text("返回", style: TextStyle(fontSize: 16),)
            ]
          )
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
          child: Column(children: <Widget>[
          ],)
        ),
    );
  }

  testRequset() async {
    try {
      Map<String, dynamic> from = {"userName": '1', 'password': '1'};
      Map response = await Request().post('/api/login', from);
      print(response);
      if (response['status'] == 'success') {
         await Future.delayed(Duration(seconds: 2));
      } else {
        BotToast.showSimpleNotification(title: "登录失败", subTitle: response['msg'].toString()); //弹出简单通知Toast
      }
    } on Exception catch (e) {
      print('---catch---');
      print(e);
    }
  }

}
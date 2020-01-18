import 'package:flutter/material.dart';

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
}
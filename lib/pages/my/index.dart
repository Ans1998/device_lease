import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import './../../request/index.dart';
import 'package:bot_toast/bot_toast.dart';
class MyPages extends StatefulWidget {

  MyPages({Key key}) : super(key: key); // 构造函数

  @override
  _MyPagesState createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  
  getMyInfo() async {
    // 获取实例
    var prefs = await SharedPreferences.getInstance();
    // 获取存储数据
    String userInfo = prefs.getString('userInfo');
    Map obj = json.decode(userInfo);
    print(obj);
    // print(obj.runtimeType);
  }

  @override
  Widget build(BuildContext context) {

    getMyInfo();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("我的"),
      // ),
      body: Container(
          child: Column(children: <Widget>[
            MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Expanded(
                  child: Container(
                    // decoration: BoxDecoration(
                    //   color: Colors.red,
                    // ),
                    child: SingleChildScrollView(
                      child:  Column(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                // decoration: BoxDecoration(
                                //   color: Colors.pink,
                                // ),
                                height: 350,
                                child: Stack(
                                  children: <Widget>[
                                    Image.asset('images/public/background.png'),
                                    Positioned(
                                      top: 150,
                                      left: 20,
                                      right: 20,
                                      child: SizedBox(
                                        height: 200,
                                        child: Card(
                                          // 带有圆角，阴影，边框等效果的卡片
                                          color: Colors.white, // 设置背景颜色
                                          elevation: 10, // 设置阴影
                                          // margin: EdgeInsets.all(10), // 设置外边距
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),  //设置圆角
                                          child: Column(
                                            children: <Widget>[
                                              // Container(
                                              //   height: 60,
                                              //   color: Colors.white,
                                              //   child: null,
                                              // ),
                                              Container(
                                                margin: EdgeInsets.only(top: 60),
                                                // color: Colors.red,
                                                child: Center(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text('昵称：18320713063', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // color: Colors.blue,
                                                child: Center(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text('ID：18320713063', style: TextStyle(fontSize: 16, color: Color(0xAAAAAAAA), fontWeight: FontWeight.w700),),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        padding: EdgeInsets.only(left: 10, right: 10),
                                                        decoration: BoxDecoration(
                                                          // color: Colors.red,
                                                          border: Border(
                                                            right: BorderSide(
                                                              color: Color(0xAAAAAAAA), 
                                                              width: 1.0, 
                                                              style: BorderStyle.solid
                                                            )
                                                          )
                                                        ),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Text('设备总数(台)', style: TextStyle(fontSize: 13, color: Color(0xAAAAAAAA), fontWeight: FontWeight.w700)),
                                                            Text('2', style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700),)
                                                          ],
                                                        ),
                                                      )
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        padding: EdgeInsets.only(left: 15, right: 15),
                                                         decoration: BoxDecoration(
                                                          // color: Colors.blue,
                                                          border: Border(
                                                            right: BorderSide(
                                                              color: Color(0xAAAAAAAA), 
                                                              width: 1.0, 
                                                              style: BorderStyle.solid
                                                            )
                                                          )
                                                        ),
                                                        child: Column(
                                                            children: <Widget>[
                                                             Text('总消费金额(￥)', style: TextStyle(fontSize: 13, color: Color(0xAAAAAAAA), fontWeight: FontWeight.w700)),
                                                            Text('0.03', style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700),)
                                                            ],
                                                          ),
                                                        ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        padding: EdgeInsets.only(left: 10, right: 10),
                                                        decoration: BoxDecoration(
                                                          // color: Colors.red,
                                                          // border: Border(
                                                          //   right: BorderSide(
                                                          //     color: Color(0xAAAAAAAA), 
                                                          //     width: 1.0, 
                                                          //     style: BorderStyle.solid
                                                          //   )
                                                          // )
                                                        ),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Text('总用水量(L)', style: TextStyle(fontSize: 13, color: Color(0xAAAAAAAA), fontWeight: FontWeight.w700)),
                                                            Text('12', style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700),)
                                                          ],
                                                        ),
                                                      )
                                                    )
                                                  ],
                                                ),
                                              )

                                            ]
                                          ),
                                        ),
                                      )
                                    ),
                                    Align(
                                      alignment: Alignment(0.0, -0.2),
                                      child: ClipOval(
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          color: Colors.white,
                                          child: Image.network('http://rent.9kbs.cn/statics/img/v2_q17hg7.png', width: 90,height: 90,),
                                        ),
                                      )
                                    ), 
                                  ],
                                ),
                              )
                            ],
                          )
                        ),
                        Container(
                          // decoration: BoxDecoration(
                          //   color: Colors.blue,
                          // ),
                          child: Column(
                            children: <Widget>[
                              publicList('h5/static/img/my/1.png', '我的订单', 'order'),
                              Container(
                                height: 8,
                                decoration: BoxDecoration(color: Colors.grey[300]),
                              ),
                              publicList('h5/static/img/my/2.png', '设备报修', 'repairs'),
                              Container(
                                height: 2,
                                decoration: BoxDecoration(color: Colors.grey[300]),
                              ),
                              publicList('h5/static/img/my/3.png', '设备退租', 'null'),
                              Container(
                                height: 8,
                                decoration: BoxDecoration(color: Colors.grey[300]),
                              ),
                              publicList('h5/static/img/my/4.png', '帮组中心', 'null'),
                              Container(
                                height: 2,
                                decoration: BoxDecoration(color: Colors.grey[300]),
                              ),
                              publicList('h5/static/img/my/5.png', '关于我们', 'null'),
                              Container(
                                height: 60,
                                padding: EdgeInsets.only(left: 20, right: 20),
                                // decoration: BoxDecoration(color: Colors.red),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: RaisedButton(
                                        color: Colors.red,
                                        highlightColor: Colors.blue, //按钮按下时的背景颜色
                                        colorBrightness: Brightness.dark, //按钮主题，默认是浅色主题 
                                        splashColor: Colors.grey, // 设置溅墨效果的颜色
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), // 外形
                                        padding: EdgeInsets.only(top: 10, bottom: 10),
                                        child: Text("退出登录", style: TextStyle(fontSize: 16)),
                                        onPressed: () {
                                          loginOut();
                                          print('按钮');
                                        },
                                      )
                                    )
                                  ],
                                )
                              )
                            ]
                          ),
                        )
                      ],
                    ),
                    )
                   
                  )
                )
            )
          ],)
        ),
    );
  }
  publicList(String icon, String title, String type) {
    return GestureDetector(
      onTap: () {
        switch(type) {
          case 'null':
          print('不做处理');
          break;
          case 'order':
          print('订单');
          Navigator.pushNamed(context, '/my/order');
          break;
          case 'repairs':
          print('报修');
          Navigator.pushNamed(context, '/my/repairs');
          break;
        }
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Container(
              width: 40,
              // decoration: BoxDecoration(color: Colors.white),
              child: Image.network('http://rent.9kbs.cn/' + icon, width: 30, height: 30,),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // decoration: BoxDecoration(color: Colors.green),
                child: Text(title, style: TextStyle(fontSize: 16),),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                // decoration: BoxDecoration(color: Colors.white),
                child: Image.network('http://rent.9kbs.cn/h5/static/img/public/left_arrows.png', width: 30, height: 20,),
              ),
            )
          ]
        ),
      )
    );
  }

  loginOut() async {
     // 获取实例
    var prefs = await SharedPreferences.getInstance();
    try {
      Map<String, dynamic> from = {};
      Map response = await Request().post('/api/logOut', from);
      print(response);
      if (response['status'] == 'success') {
        BotToast.showLoading( duration: Duration(seconds: 2));
        await Future.delayed(Duration(seconds: 2));
        // 删除存储数据
        prefs.remove('userInfo');
        prefs.remove('token');
        Navigator.popAndPushNamed(context, '/login');
        // prefs.remove(key); //删除指定键
        // prefs.clear();//清空键值对
      } else {
        BotToast.showSimpleNotification(title: "退出失败", subTitle: response['msg'].toString()); //弹出简单通知Toast
      }
    } on Exception catch (e) {
      print('---catch---');
      print(e);
    }
  }
}
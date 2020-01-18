import 'package:flutter/material.dart';

import './../navigat/index.dart';

class LoginPages extends StatefulWidget {

  LoginPages({Key key}) : super(key: key); // 构造函数

  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {

  FocusNode _userNameInputFocus = FocusNode();
  FocusNode _passwordInputFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("登录"),
      // ),
      body: Container(
          child: Column(
            children: <Widget>[
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.red,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Image.asset('images/public/background.png'),
                        Positioned(
                          top: 100,
                          left: 40,
                          child: Text("登录", style: TextStyle(fontSize: 30, color: Colors.white),),
                        ),
                        Positioned(
                          top: 160,
                          left: 20,
                          right: 20,
                          child: Card(
                            // 带有圆角，阴影，边框等效果的卡片
                            color: Colors.white, // 设置背景颜色
                            elevation: 10, // 设置阴影
                            // margin: EdgeInsets.all(10), // 设置外边距
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),  //设置圆角
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 40, 20, 80),
                              child: Column(
                              children: <Widget>[
                                Container(child: userNameInputItem()),
                                Container(child: passwordInputItem(), margin: EdgeInsets.fromLTRB(0, 10, 0, 50)),
                                Row(children: <Widget>[publicFlatButton('login')], mainAxisAlignment: MainAxisAlignment.center),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(children: <Widget>[publicFlatButton('register')], mainAxisAlignment: MainAxisAlignment.center),
                              ],
                              ),
                            )
                          ),
                        )

                      ],
                    ),
                  )
                )
               
              )
            ]
          )
        ),
    );
  }
  publicFlatButton(String type) {
    return Container(
      child: Expanded(
        child: FlatButton(
          color: type == 'register' ? Colors.grey : Colors.blue, // 设置按钮背景颜色
          // disabledTextColor: Colors.grey, //按钮禁用时的文字颜色
          disabledColor: Colors.grey,//按钮禁用时的背景颜色
          highlightColor: Colors.blue, //按钮按下时的背景颜色
          colorBrightness: Brightness.dark, //按钮主题，默认是浅色主题 
          splashColor: Colors.grey, // 设置溅墨效果的颜色
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10), // 按钮的填充
          child: Text(type == 'register' ? '注册' : '登录', style: TextStyle(fontSize: 15)), // 按钮的内容
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), // 外形
          onPressed: () {
            switch(type) {
              case 'login':
                print('登录');
                _passwordInputFocus.unfocus(); // 失去焦点
                _userNameInputFocus.unfocus(); // 失去焦点
                // Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppPages()));
                // Navigator.pushNamed(
                //   context, 
                //   '/navigat', 
                //   arguments: <String, int> {
                //     'tabCurrentIndex': 1
                //   }
                // );
                Navigator.of(context).pushAndRemoveUntil(
                 MaterialPageRoute(builder: (context) => MyAppPages()
                ), (route) => route == null);
              break;
              case 'register':
                print('注册');
                _passwordInputFocus.unfocus(); // 失去焦点
                _userNameInputFocus.unfocus(); // 失去焦点
                // Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppPages()));
                 Navigator.of(context).pushAndRemoveUntil(
                 MaterialPageRoute(builder: (context) => MyAppPages()
                ), (route) => route == null);
              break;
            }
          },
        ),
      ),
    );
  }
  userNameInputItem() {
    return TextField(
      focusNode: _userNameInputFocus, // 失去焦点
      autofocus: false, // 是否自动对焦
      style: TextStyle(fontSize: 15, color: Colors.black, textBaseline: TextBaseline.alphabetic), //输入文本的样式(textBaseline: TextBaseline.alphabetic修复光标不对准问题)
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          hintStyle: TextStyle(color: Colors.grey, locale: Locale('en', 'US')),
          hintText: "请输入用户名",
          // 未获得焦点下划线设为灰色
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
          ),
          // 获得焦点下划线设为蓝色
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
      ),
      // 当 value 改变的时候，触发
      onChanged: (val) {
          print(val);
      },
      onSubmitted: (text) { // 内容提交(按回车)的回调
        print('submit $text');
      },
    );
  }
  passwordInputItem() {
    return TextField(
      focusNode: _passwordInputFocus, // 失去焦点
      autofocus: false, // 是否自动对焦
      autocorrect: true,// 是否自动更正
      obscureText: true,//是否是密码
      textAlign: TextAlign.left,//文本对齐方式
      style: TextStyle(fontSize: 15, color: Colors.black, textBaseline: TextBaseline.alphabetic),//输入文本的样式
      // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
      // enabled: true,//是否禁用
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          hintStyle: TextStyle(color: Colors.grey),
          hintText: "请输入密码",
          // 未获得焦点下划线设为灰色
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
          ),
          // 获得焦点下划线设为蓝色
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
      ),
      // 当 value 改变的时候，触发
      onChanged: (val) {
          print(val);
      },
      onSubmitted: (text) { // 内容提交(按回车)的回调
        print('submit $text');
      },
    );
  }
}
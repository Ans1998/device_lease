import 'package:flutter/material.dart';


import './../home/index.dart';
import './../my/index.dart';
import './../list/index.dart';

class MyAppPages extends StatefulWidget {

  MyAppPages({Key key}) : super(key: key); // 构造函数

  @override
  _MyAppPagesState createState() => _MyAppPagesState();
}

class _MyAppPagesState extends State<MyAppPages> {

  var _controller = PageController(initialPage: 0);

  int _tabCurrentIndex = 0;
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  @override
  Widget build(BuildContext context) {

    // final Map arguments = ModalRoute.of(context).settings.arguments; // 接收参数
    // print(arguments);
    // if (arguments != null) {
    //   setState(() {
    //     _tabCurrentIndex = arguments["tabCurrentIndex"];
    //   });
    // }
    
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(""),
      // ),
      body: PageView(
         controller: _controller,
         children: <Widget>[ HomePages(), ListPages(), MyPages() ],
         physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
         currentIndex: _tabCurrentIndex,
         onTap: (index) {
           _controller.jumpToPage(index);
           setState(() {
             _tabCurrentIndex = index;
           });
         },
         type: BottomNavigationBarType.fixed,
         items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _defaultColor),
              activeIcon: Icon(Icons.home, color: _activeColor),
              title: Text("首页", style: TextStyle(color: _tabCurrentIndex != 0 ? _defaultColor : _activeColor))
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: _defaultColor),
              activeIcon: Icon(Icons.shopping_cart, color: _activeColor),
              title: Text("商品列表", style: TextStyle(color: _tabCurrentIndex != 1 ? _defaultColor : _activeColor))
            ),
            BottomNavigationBarItem(
             icon: Icon(Icons.account_circle, color: _defaultColor),
             activeIcon: Icon(Icons.account_circle, color: _activeColor),
             title: Text("我的", style: TextStyle(color: _tabCurrentIndex != 2 ? _defaultColor : _activeColor))
           ),
          ]
      )
    );
  }
}
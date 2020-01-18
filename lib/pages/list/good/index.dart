import 'package:flutter/material.dart';

import 'dart:async';

class GoogListPages extends StatefulWidget {
  GoogListPages({Key key}) : super(key: key);

  @override
  _GoogListPagesState createState() => _GoogListPagesState();
}

class _GoogListPagesState extends State<GoogListPages> {

  ScrollController _leftScrollController = ScrollController(); // 滚动左边监听
  ScrollController _rightScrollController = ScrollController(); // 滚动右边监听
  ScrollController _fatherScrollController = ScrollController(); // 滚动右边监听

  int _selected = 0;

  List<Map> leftList = [ {'name': 'A套餐', 'key': 0}, {'name': 'B套餐', 'key': 1}, {'name': 'C套餐', 'key': 2}];
 
  List<Map> rightList = [
    {"name": "A套餐", "data": [{ "name": "1-A套餐"}, { "name": "2-A套餐"}, { "name": "3-A套餐"} ] },
    {"name": "B套餐", "data": [{ "name": "1-B套餐"}, { "name": "2-B套餐"},{ "name": "1-B套餐"}, { "name": "2-B套餐"}] },
    {"name": "C套餐", "data": [{ "name": "1-C套餐"}, { "name": "2-C套餐"}, { "name": "3-C套餐"}, { "name": "1-C套餐"}, { "name": "2-C套餐"}, { "name": "3-C套餐"} ] }
    ];
  List rightListHeight = []; // 右边列表高度

  @override
  void initState() {
    computeHight(); // 计算高度

    // 左边滑动
    _leftScrollController.addListener(() {
      print(_leftScrollController.offset); //打印滚动位置
      if (_leftScrollController.offset == 0.0) { // 拉到顶部
          // _fatherScrollController.jumpTo(0.0);
        _fatherScrollController.animateTo(.0,
                duration: Duration(milliseconds: 200),
                curve: Curves.ease
            );
      }
      if (_leftScrollController.position.pixels == _leftScrollController.position.maxScrollExtent) { // 拉到底部
        print('----left----');
        // _fatherScrollController.jumpTo(_leftScrollController.position.maxScrollExtent);
          _fatherScrollController.animateTo(_leftScrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 200),
                curve: Curves.ease
            );
        // physics: new NeverScrollableScrollPhysics(), //禁用滑动事件
      }

    });
    
    super.initState();
  }
  
  // 计算右边高度
  computeHight() {
    int lastHeight = 0; // 记录上个位置

    rightList.forEach((value) {
      List dataLeight = value['data'];

      int start = lastHeight; // 开始位置
      int end = 90 * dataLeight.length; // 结束位置
      lastHeight = end + lastHeight; // 记录当前结束位置(变成上个位置)
      rightListHeight.add({
        'start': start,
        'end': end
      }); // 获取右边高度
    });
    print(rightListHeight);
  }

  @override
  void deactivate() {
    _leftScrollController.dispose(); // 为了避免内存泄露，需要调用_controller.dispose
    _rightScrollController.dispose(); // 为了避免内存泄露，需要调用_controller.dispose
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context));
   final mediaQuerySize = MediaQuery.of(context).size; // 获取手机信息
   final width = mediaQuerySize.width; // 获取宽度
   final height = mediaQuerySize.height; // 获取高度

   return Scaffold(
     appBar: AppBar(
        title: Text("商品列表"),
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
          child: SingleChildScrollView(
            controller: _fatherScrollController,
            child: Column(
              children: <Widget>[

                // 头部
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    // color: Colors.red
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Image.asset('images/public/background.png', fit: BoxFit.cover),
                  )
                ),


                // 分割线
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.green
                  ),
                ),

                // 中间
                Container(
                  // height: 400,
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: height - 160,
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                          child: ListView(
                            padding: EdgeInsets.all(0),
                            controller: _leftScrollController,
                            shrinkWrap: true,
                            children: <Widget>[
                              leftBuild()
                            ],
                          )
                        ),
                      ),

                      Expanded(
                        flex: 3,
                        child: Container(
                          height: height - 160,
                          decoration: BoxDecoration(
                            color: Colors.blue
                          ),
                          child: NotificationListener(
                            onNotification: (notification) {
                              switch (notification.runtimeType){
                                case ScrollStartNotification: 
                                  // print(notification);
                                  print("开始滚动"); 
                                break;
                                case ScrollUpdateNotification: 
                                  // print(notification);
                                  print("正在滚动"); 
                                break;
                                case ScrollEndNotification:
                                  print("滚动停止");
                                  // print(notification.metrics.pixels); // 当前滚动位置
                                  // print(notification.metrics.maxScrollExtent); // 最大滚动位置
                                  // 拉到顶部
                                  if (notification.metrics.pixels == 0.0) {
                                     _fatherScrollController.animateTo(0.0,
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.ease
                                    );
                                  }
                                  
                                  // 联动左边导航栏
                                  for (var i=0; i < rightListHeight.length; i ++) {
                                    // print(rightListHeight[i]);
                                    // 思路 拿数组里面的开始值进行范围比较
                                    int scrollY = notification.metrics.pixels.toInt();
                                    Map height = rightListHeight[i];
                                    // print(scrollY);
                                    // print(height);
                                    if (scrollY >= height['start']) {
                                      setState(() {
                                        _selected = i;
                                      });
                                    }
                                  }

                                break;
                                case OverscrollNotification:
                                  print("滚动到边界");
                                   _fatherScrollController.animateTo(notification.metrics.maxScrollExtent,
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.ease
                                    );
                                break;
                              }
                            },
                            child: ListView(
                              padding: EdgeInsets.all(0),
                              controller: _rightScrollController,
                              shrinkWrap: true,
                              children: <Widget>[
                                rightBuild()
                              ],
                            )
                          )
                        )
                      )

                    ],
                  )
                ),

                // 底部
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                  child: Row(
                    children: <Widget>[
                      Text('---底部---')
                    ],
                  ),
                )
              ]
          ),
        )
      )
    );
  }

  rightBuild() {
    List<Widget> rightNav = []; // 先建一个数组用于存放循环生成的widget
    rightList.forEach((value) {
      rightNav.add(
        Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // height: 30,
                color: Colors.brown,
                child: Row(
                  children: <Widget>[
                    Text(value['name'])
                  ],
                )
              ),
              rightBuildItem(value['data'])
            ]
          ),
        )
      );
    });
    return Column(
      children: rightNav
    );
  }

  rightBuildItem(List data) {
    print(data);
    List<Widget> rightNavItem = []; //先建一个数组用于存放循环生成的widget
    data.forEach((val) {
      rightNavItem.add(_rightList(val['name']));
    });
    return Column(
      children: rightNavItem
    );
  }

  Widget _rightList(String title) {
    return (
      Container(
        height: 90,
        color: Colors.pink,
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("right" + "---" + title)
                  ],
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.pink,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add)
                  ],
                ),
              )
            ),
          ],
        )
      )
    );
  }
  

 leftBuild() {
    List<Widget> leftNav = [] ; //先建一个数组用于存放循环生成的widget
    for (var item in leftList) {
      leftNav.add(_leftItem(item['name'], item['key']));
    }
    return Column(
      children: leftNav
    );
  }

  Widget _leftItem(String title, int index) {
    return (
      GestureDetector (
        onTap: () {
          // 判断滑动位置
          setState(() {
           _selected = index;
          });
          double goStart = rightListHeight[index]['start'].toDouble();

          _rightScrollController.animateTo(goStart,
              duration: Duration(milliseconds: 200),
              curve: Curves.ease
          );


        },
        child: Container(
          margin: EdgeInsets.only(bottom: 3),
          decoration: BoxDecoration(
            color: _selected == index ? Colors.red : Colors.grey[600]
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title)
            ],
          )
        )
      )
    );
  }

}
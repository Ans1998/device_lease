import 'package:flutter/material.dart';

import './component/header/index.dart';

import './../../component/bubble/index.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';


class HomePages extends StatefulWidget {

  HomePages({Key key}) : super(key: key); // 构造函数

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.dashboard),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text("F00000037D"),
            )
          ],
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            // 头部
            Container(
              color: Colors.blue,
              child: Stack(
                children: <Widget>[
                  Container(
                    // color: Colors.pink,
                    height: 230,
                    child: DonutAutoLabelChart.withSampleData(),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 50,
                    child: Container(
                      // margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外填充
                      constraints: BoxConstraints.tightFor(width: 100.0, height: 60.0), //卡片大小
                      decoration: BoxDecoration(//背景装饰
                          gradient: RadialGradient( //背景径向渐变
                              colors: [Colors.red, Colors.orange],
                              center: Alignment.topLeft,
                              radius: .98
                          ),
                          boxShadow: [ //卡片阴影
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 4.0
                            )
                          ]
                      ),
                      transform: Matrix4.rotationZ(.2), //卡片倾斜变换
                      alignment: Alignment.center, //卡片内文字居中
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("总量：1000L", style: TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
            
            // 设备状态
            Container(
              child: Column(
                children: <Widget>[

                  Container(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    // color: Colors.grey[200],
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 40,
                          alignment: Alignment.centerLeft,
                          // color: Colors.pink,
                          child: Icon(Icons.local_play, color: Colors.green, size: 30,),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            // color: Colors.red,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('设备状态：' + '正常', style: TextStyle(color: Colors.green, fontSize: 16),),
                                Text('01-17 12:00', style: TextStyle(color: Color(0x66666666), fontSize: 13)),
                              ],
                            )
                          ),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     alignment: Alignment.centerRight,
                        //     // color: Colors.pink,
                        //     child: Image.network('http://rent.9kbs.cn/h5/static/img/public/left_arrows.png', width: 30, height: 20,),
                        //   ),
                        // )
                      ],
                    ),
                  ),

                  Container(
                    height: 2,
                    color: Colors.grey[200],
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    // color: Colors.grey[200],
                    child: Column(
                      children: <Widget>[
                         Row(
                          children: <Widget>[
                            Container(
                              width: 40,
                              alignment: Alignment.centerLeft,
                              // color: Colors.pink,
                              child: Icon(Icons.local_play, color: Colors.red, size: 30,),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                // color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('水位：' + '高水位', style: TextStyle(color: Colors.green, fontSize: 16),),
                                    Text('01-17 12:00', style: TextStyle(color: Color(0x66666666), fontSize: 12)),
                                  ],
                                )
                              ),
                            ),
                            // Expanded(
                            //   flex: 1,
                            //   child: Container(
                            //     alignment: Alignment.centerRight,
                            //     color: Colors.pink,
                            //     child: Image.network('http://rent.9kbs.cn/h5/static/img/public/left_arrows.png', width: 30, height: 20,),
                            //   ),
                            // )
                          ],
                        ),
                        _progress(0.5, Colors.green)
                      ],
                    )
                  ),

                  Container(
                    height: 2,
                    color: Colors.grey[200],
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    // color: Colors.grey[200],
                    child: Column(
                      children: <Widget>[
                         Row(
                          children: <Widget>[
                            Container(
                              width: 40,
                              alignment: Alignment.centerLeft,
                              // color: Colors.pink,
                              child: Icon(Icons.local_play, color: Colors.red, size: 30,),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                // color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('净水TDS：' + '正常', style: TextStyle(color: Colors.green, fontSize: 16),),
                                    Text('01-17 12:00', style: TextStyle(color: Color(0x66666666), fontSize: 12)),
                                  ],
                                )
                              ),
                            ),
                            // Expanded(
                            //   flex: 1,
                            //   child: Container(
                            //     alignment: Alignment.centerRight,
                            //     color: Colors.pink,
                            //     child: Image.network('http://rent.9kbs.cn/h5/static/img/public/left_arrows.png', width: 30, height: 20,),
                            //   ),
                            // )
                          ],
                        ),
                        _progress(0.1, Colors.yellow)
                      ],
                    )
                  ),

                  // Container(
                  //   height: 2,
                  //   color: Colors.grey[200],
                  // ),

                ],
              ),
            ),

          ],)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scan();
        },
        child: Container(
          // padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.camera_alt),
            ],
          )
        )
      ),
    );
  }
  //  扫描二维码
  Future scan() async {
    try {
      // 此处为扫码结果，barcode为二维码的内容
      String barcode = await BarcodeScanner.scan();
      print('扫码结果: '+barcode);
    } on PlatformException   catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        // 未授予APP相机权限
        print('未授予APP相机权限');
      } else {
        // 扫码错误
        print('扫码错误: $e');
      }
    } on FormatException{
      // 进入扫码页面后未扫码就返回
      print('进入扫码页面后未扫码就返回');
    } catch (e) {
      // 扫码错误
      print('扫码错误: $e');
    }
  }

  _progress(double y, Color color) {
    return(
      Column(
        children: <Widget>[
          Align(
            alignment: Alignment(-y, 1.0),
            child: BubbleWidget(
              38.0,
              35.0,
              // Colors.deepOrange.withOpacity(0.7),
              color,
              BubbleArrowDirection.bottom,
              innerPadding: 0.0,
              child: Text('正常',style:TextStyle(color: Colors.white, fontSize: 13.0))
            ),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.0), topLeft: Radius.circular(4.0))
                    )
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red[200],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(4.0), topRight: Radius.circular(4.0))
                    )
                  ),
                ),
              ],
            )
          )
        ],
      )
    );
  }
}


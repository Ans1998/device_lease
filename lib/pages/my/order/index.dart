import 'package:flutter/material.dart';

class OrderPages extends StatefulWidget {
  OrderPages({Key key}) : super(key: key);

  @override
  _OrderPagesState createState() => _OrderPagesState();
}

class _OrderPagesState extends State<OrderPages> {
  @override
  Widget build(BuildContext context) {
   return DefaultTabController (
     length: 3,
     child: Scaffold(
      backgroundColor: Colors.grey[200], // 设置背景颜色
      appBar: AppBar(
        title: Text("我的订单"),
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
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 16),
          tabs: <Widget>[
            Tab(text: '租赁订单',),
            Tab(text: '退租订单',),
            Tab(text: '报修订单',),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          itemLease(),
          
          itemQuit(),

          itemRepairs()
        ],
      ),
    )
   );
  }
  final titleStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w700);
  final midlleStyle = TextStyle(fontSize: 14); // color: Colors.grey[900]
  itemLease() {
    return(
      ListView(
        shrinkWrap: true, 
        children: <Widget>[
          __item(true),
          __item(false),
          __item(true)
        ],
      )
    );
  }
  itemQuit() {
    return (
     ListView(
        shrinkWrap: true, 
        children: <Widget>[
          __item(false)
        ],
      )
    );
  }
  itemRepairs() {
    return (
     ListView(
        shrinkWrap: true, 
        children: <Widget>[
          __item(false)
        ],
      )
    );
  }
  __item(bool show) {
    return (
      Container(
        // padding: EdgeInsets.only(left: 20, right: 20),
        // decoration: BoxDecoration(
        //   color: Colors.blue
        // ),
        child: Column(children: <Widget>[
          Container(
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey[200]
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Color(0x66666666), 
                  width: 1.0, 
                  style: BorderStyle.solid
                )
              )

            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.red
                    ),
                    child: Text('订单号：20200103113226968937', style: titleStyle),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:  Container(
                    decoration: BoxDecoration(
                      // color: Colors.blue
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        !show ? Text("付款成功", style: titleStyle) : Text("等待付款", style: titleStyle),
                        show ? Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("取消", style: TextStyle(fontSize: 14, color: Color(0x66666666)))
                        ) : Text('')
                      ]
                    )
                  )
                )
              ],
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Color(0x66666666), 
                  width: 1.0, 
                  style: BorderStyle.solid
                )
              )
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      // color: Colors.blue
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("计费模式：" + "计量", style: midlleStyle, textAlign: TextAlign.justify,),
                        Text("租赁单位：" + "0.00元/L", style: midlleStyle),
                        Text("租赁时长：" + "10L", style: midlleStyle),
                        Text("设备编号：" + "F00000037C", style: midlleStyle)
                      ]
                    )
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      // color: Colors.pink
                    ),
                    child:Text('￥0.01', style: TextStyle(fontSize: 14, color: Colors.red),)
                  )
                )
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      // color: Colors.red
                    ),
                    child: Text('2020-01-03 11:32:26'),
                  ),
                ),
                Expanded(
                  flex: 1,
                   child: Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      // color: Colors.pink
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        show ? Container(
                          height: 30,
                          width: 80,
                          child:OutlineButton(
                            color: Colors.white,
                            child: Text("去支付", style: TextStyle(color: Colors.red),),
                            borderSide: BorderSide(color: Colors.red), // Theme.of(context).primaryColor 获取主题颜色
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            onPressed: () {},
                          )
                        ) : Container(height: 30, width: 80),
                        Container(
                          height: 30,
                          width: 88,
                          margin: EdgeInsets.only(left: 10),
                          child:OutlineButton(
                            color: Colors.white,
                            child: Text("订单详情", style: TextStyle(color: Colors.red),),
                            borderSide: BorderSide(color: Colors.red), // Theme.of(context).primaryColor 获取主题颜色
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            onPressed: () {
                               Navigator.pushNamed(context, '/my/order/details');
                            },
                          )
                        ),
                      ],
                    )
                  ),
                )
              ],
            ),
          ),


          Container(
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey[200]
            ),
          ),

        ],)
      )
    );
  }
}
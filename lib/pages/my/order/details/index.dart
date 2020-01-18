import 'package:flutter/material.dart';

class OrderDetailsPages extends StatefulWidget {
  OrderDetailsPages({Key key}) : super(key: key);

  @override
  _OrderDetailsPagesState createState() => _OrderDetailsPagesState();
}

class _OrderDetailsPagesState extends State<OrderDetailsPages> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("订单详情"),
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
        decoration: BoxDecoration(
          color:  Colors.grey[200], // 设置背景颜色
        ),
        child: Column(children: <Widget>[

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
                  flex: 1,
                  child: Text('订单详情', textAlign: TextAlign.start,),
                ),
                Expanded(
                  flex: 1,
                  child: Text('￥300.00', textAlign: TextAlign.end, style: TextStyle(color: Colors.red),),
                )
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('订单编号：'+ "20200103113226968937"),
                    Text('订单标题：'+ "设备租赁(设备:F00000037C)"),
                    Text('订单类型：'+ "普通订单"),
                    Text('下单时间：'+ "2019-11-14 11:45:36"),
                    Row(
                      children: <Widget>[
                        Text("订单总额："),
                        Text('￥0.01', style: TextStyle(color: Colors.red))
                      ],
                    ),
                    Text('订单状态：'+ "付款成功"),
                     Row(
                      children: <Widget>[
                        Text("支付金额："),
                        Text('￥0.01', style: TextStyle(color: Colors.red))
                      ],
                    ),
                    Text('计费模式'+ "计量"),
                    Text('租赁单价'+ "0.00元/L"),
                    Text('租赁时长'+ "10L"),
                    Text('设备编号：'+ "F00000037C")
                  ],
                )
              ],
            ),
          )

        ],)
        ),
    );
  }
}
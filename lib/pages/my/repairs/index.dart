import 'package:flutter/material.dart';

class RepairsPages extends StatefulWidget {
  RepairsPages({Key key}) : super(key: key);

  @override
  _RepairsPagesState createState() => _RepairsPagesState();
}

class _RepairsPagesState extends State<RepairsPages> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("设备报修"),
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
          child: Column(
            children: <Widget>[
              _item(),
              _item()
            ]
          )
        ),
    );
  }

  _item() {
    return (
      Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 200,
        decoration: BoxDecoration(
          // color:  Colors.blue, // 设置背景颜色
        ),
        child: Card(
          color: Colors.blue, // 背景颜色
          elevation: 10, // 设置阴影
          // margin: EdgeInsets.all(10), // 设置外边距
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),  //设置圆角
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          // color:  Colors.blue, // 设置背景颜色
                        ),
                        child: Image.network('http://rent.9kbs.cn/h5/static/img/home/home_no_data.png', width: 104, height: 140,),
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        // color:  Colors.pink, // 设置背景颜色
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          Text("饮水机租赁1号机", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),

                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text("03F4010001", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                          ),

                          Row(
                            children: <Widget>[
                              Text('报修费用：', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                              Text("￥100.00", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),)
                            ],
                          )
                        ],
                      ),
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          // color:  Colors.blue, // 设置背景颜色
                        ),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Image.network('http://rent.9kbs.cn/h5/static/img/home/scouring_bath.png', width: 55, height: 55),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text('报修', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15))
                            )
                          ],
                        ),
                    )
                  ),
                ],
              ),

              Container(
                decoration: BoxDecoration(
                  // color:  Colors.blue, // 设置背景颜色
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.white,),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('正峰研发部', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))
                    )
                  ],
                ),
              )
            ],
          )

        )
      )
    );
  }
}
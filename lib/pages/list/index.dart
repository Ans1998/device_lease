import 'package:flutter/material.dart';

class ListPages extends StatefulWidget {
  ListPages({Key key}) : super(key: key);

  @override
  _ListPagesState createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        title: Text("列表"),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          children: <Widget>[
            _item()
          ],
        )
      )
    );
  }
  _item() {
    return (
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/list/goods');
        },
        child: Container(
          height: 48,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.red,
                  child: Text('商品列表', style: TextStyle(fontSize: 16)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  // decoration: BoxDecoration(color: Colors.white),
                  child: Image.network('http://rent.9kbs.cn/h5/static/img/public/left_arrows.png', width: 30, height: 20,),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

}
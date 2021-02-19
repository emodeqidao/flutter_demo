

import 'package:flutter/material.dart';

class RowColumnWidgetPage extends StatefulWidget {
  @override
  _RowColumnWidgetPageState createState() => _RowColumnWidgetPageState();
}

class _RowColumnWidgetPageState extends State<RowColumnWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('row column'),
      ),
      body: RowBody(),
    );
  }
}

Widget RowBody () {
  return  Container(
    decoration: BoxDecoration(
        border: Border.all(width: 5.0, color: Colors.black)),
    child: Row(
      children: <Widget>[
        Container(
          height: 50,
          width: 100,
          color: Colors.red,
        ),
        Container(
          height: 50,
          width: 100,
          color: Colors.green,
        ),
        Container(
          height: 50,
          width: 100,
          color: Colors.blue,
        ),
      ],
    ),
  );
}
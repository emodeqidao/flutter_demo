
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 5.0, color: Colors.black)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          // textDirection: TextDirection.ltr,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 50,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 150,
              width: 100,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo')
      ),
      body:  Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('raise'),
              onPressed: (){
                print('我点击了 raise button');
              },
            ),
            RaisedButton.icon(
              label: Text('raise'),
              icon: Icon(Icons.send),
              onPressed: (){
                print('我点击了 RaisedButton.icon');
              },
            ),
            FlatButton(
              child: Text('flat'),
              onPressed: (){
                print('我点击了 flat button');
              },
            ),
            FlatButton.icon(
              label: Text('flat'),
              icon: Icon(Icons.add),
              onPressed: (){
                print('我点击了 FlatButton.icon');
              },
            ),
            OutlineButton(
              child: Text('Outline'),
              onPressed: () {
                print('我点击了 Outline button');
              },
            ),
            OutlineButton.icon(
              label: Text('Outline'),
              icon: Icon(Icons.accessibility_sharp),
              onPressed: () {
                print('我点击了 Outline button');
              },
            ),
            IconButton(
                icon: Icon(Icons.thumb_up_alt_outlined),
                onPressed: () {
                  print('我点击了 IconButton button');
            }),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

}
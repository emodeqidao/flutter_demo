import 'package:flutter/material.dart';
import 'package:flutter_demo/Rote/SeconPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: RaisedButton(
        child: Text('home button'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SecondPage();
          }));
        },
      ),
    );
  }
}

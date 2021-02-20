import 'package:flutter/material.dart';
import 'package:flutter_demo/Rote/TwoPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: RaisedButton(
        child: Text('home button'),
        onPressed: () {
          // Navigator.of(context).maybePop();

          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return SecondPage();
          // }));

          Navigator.of(context).pushNamed('/two');
        },
      ),
    );
  }
}

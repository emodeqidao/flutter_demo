import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页面'),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('second button'),
              onPressed: () {
                // Navigator.of(context).pop();

                // Navigator.of(context).pushNamed('/three');

                // Navigator.of(context).pushReplacementNamed('/three');

                Navigator.of(context).popAndPushNamed('/three');
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*

 */
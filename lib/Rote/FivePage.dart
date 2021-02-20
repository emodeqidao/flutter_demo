import 'package:flutter/material.dart';

class FivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第5个页面'),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('5 button'),
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed('/three');
              },
            ),
          ],
        ),
      ),
    );
  }
}

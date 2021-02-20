import 'package:flutter/material.dart';

class ThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第三个页面'),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('3 button'),
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/four');

                // Navigator.of(context).pushNamedAndRemoveUntil('/four', (route) => route == null);

              },
            ),
          ],
        ),
      ),
    );
  }
}

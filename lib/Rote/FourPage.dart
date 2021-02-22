import 'package:flutter/material.dart';

class FourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第四个页面'),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('4 button'),
              onPressed: () {
                // Navigator.of(context).pop();
                // Navigator.of(context).pushNamed('/five');
                Navigator.pushNamed(context, '/five');
                // Navigator.of(context).pushNamedAndRemoveUntil('/five', ModalRoute.withName('/home'));

              },
            ),
          ],
        ),
      ),
    );
  }
}

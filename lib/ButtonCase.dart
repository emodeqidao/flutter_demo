import 'package:flutter/material.dart';

enum ButtonStatus { none, loading, done}

class ButtonCase extends StatefulWidget {
  @override
  _ButtonCaseState createState() => _ButtonCaseState();
}

class _ButtonCaseState extends State<ButtonCase> {
  ButtonStatus _buttonStatus = ButtonStatus.none;

  _buildChild() {
    if (_buttonStatus == ButtonStatus.none) {
      return Text('登录',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0
        ));
    } else if (_buttonStatus == ButtonStatus.loading) {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2.0,
      );
    } else if (_buttonStatus == ButtonStatus.done) {
      return Icon(
        Icons.check,
        color: Colors.white
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      minWidth: 240.0,
      height: 44.0,
      child: _buildChild(),
      onPressed: () {
        setState(() {
          _buttonStatus = ButtonStatus.loading;
          Future.delayed(Duration(seconds: 3), () {
            setState(() {
              _buttonStatus = ButtonStatus.done;
            });
          });
        });
      },
    );
  }
}



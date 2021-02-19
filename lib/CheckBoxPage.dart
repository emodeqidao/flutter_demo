import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  TextEditingController _usernameController = TextEditingController();

  FocusNode userNameFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _usernameController.addListener(() {
      print('listener:' + _usernameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Switch(
                value: _switchSelected,
                activeColor: Colors.red,
                onChanged: (value) {
                  print(value ? '开' : '关');
                  setState(() {
                    _switchSelected = value;
                  });
                }),
            Checkbox(
                value: _checkboxSelected,
                onChanged: (value) {
                  print(value ? '选中' : '取消选中');
                  setState(() {
                    _checkboxSelected = value;
                  });
                }),
            TextField(
              focusNode: userNameFocusNode,
              cursorColor: Colors.red,
              autofocus: true,
              controller: _usernameController,
              decoration: InputDecoration(
                  labelText: '用户名',
                  labelStyle: TextStyle(
                    color: Colors.purple,
                    fontSize: 19.0
                  ),
                  hintText: '用户名或者邮箱',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 25.0
                  ),
                  hoverColor: Colors.blue,
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                  fillColor: Colors.deepPurple,
                  focusColor: Colors.blue),
              onChanged: (value) {
                print('onChanged:' + value);
              },
            ),
            TextField(
              focusNode: passwordFocusNode,
              autofocus: true,
              decoration: InputDecoration(
                labelText: '密码',
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                hintText: '你的登录密码',
                prefixIcon: Icon(Icons.lock, color: Colors.blue),
              ),
              obscureText: true,
            ),
            RaisedButton(
                child: Text('隐藏键盘'),
                onPressed: () {
                  userNameFocusNode.unfocus();
                  passwordFocusNode.unfocus();
                }),
            RaisedButton(
              child: Text('下一个'),
              onPressed: () {
                if (focusScopeNode == null) {
                  focusScopeNode = FocusScope.of(context);
                }
                focusScopeNode.requestFocus(passwordFocusNode);
              },
            ),
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue[800]),
                  value: 0.5
              ),
            ),

            SizedBox(
              height: 100.0,
              width: 100.0,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue[800]),
                // value: 0.8
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/Rote/TwoPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatelessWidget {
  String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('home button'),
            onPressed: () {
              // Navigator.of(context).maybePop();

              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return SecondPage();
              // }));

              Navigator.of(context).pushNamed('/two');
            },
          ),
          MaterialButton(
              child: Text('save'),
              color: Colors.blue,
              onPressed: () {
                _saveDate();
              }
          ),
          MaterialButton(
              child: Text('get'),
              color: Colors.blue,
              onPressed: () {
                _getData();
              }
          ),
          MaterialButton(
              child: Text('clear'),
              color: Colors.blue,
              onPressed: () {
                _clear();
              }
          ),
          MaterialButton(
              child: Text('HttpClient'),
              color: Colors.blue,
              onPressed: () {
                _getHttpClient();
              }
          ),
        ],
      ),
    );
  }

  //http://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel=手机号
  _getHttpClient() async {
    var httpClient = HttpClient();
    var uri = Uri(
      scheme: 'http',
      host: 'tcc.taobao.com',
      path: 'cc/json/mobile_tel_segment.htm',
      queryParameters:{
        'tel': '15820278603',
      },
    );
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    print('responseBody:$responseBody');
  }


  _saveDate() async {
    var sf = await SharedPreferences.getInstance();
    print('$sf');
    sf.setString('key_xixi', 'xixi');
    print('save');
  }

  Future<String> _getData() async {
    var sf = await SharedPreferences.getInstance();
    var result = sf.getString('key_xixi');
    print('$result');
    return result;
  }

  _clear() async {
      var sf = await SharedPreferences.getInstance();
      sf.remove('key_xixi');
  }


}



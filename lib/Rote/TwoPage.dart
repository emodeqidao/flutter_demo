import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_demo/Rote/phone_info_entity.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:lib/Rote/';

import 'package:flutter/material.dart';

class TwoPageView extends StatefulWidget {
  @override
  _TwoPageViewState createState() => _TwoPageViewState();
}

class _TwoPageViewState extends State<TwoPageView> {
  String data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页面'),
      ),
      body: Container(
          child: SingleChildScrollView(
            child: Column(
            children: [
              RaisedButton(
                child: Text('second button'),
                onPressed: () {
                  // Navigator.of(context).pop();

                  // Navigator.of(context).pushNamed('/three');

                  // Navigator.of(context).pushReplacementNamed('/three');

                  // Navigator.of(context).pushNamed('/three');

                  // _getHttpClient();
                  // _getHttp();
                  _getDio();
                },

              ),

              Text('$data'),
            ],
          ),
        ),
      ),
    );
  }

  _getDio() async {
    var xdio = dio.Dio();
    dio.Response response = await xdio.get(
        'http://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel=15820278603',
        options: dio.Options(
          headers: {'Content-Type': 'application/json; charset=utf-8'}));
  
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data.toString()}');
    Map map = Map.from(response.data.toString());
    print('$map');
    PhoneInfo pf = PhoneInfo.fromJson(response.data.toString())
    setState(() {
      data = 'dio:' + response.data.toString();
    });
  }

  _getHttp() async {
    var client = Client();

    Response response = await client.get('http://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel=15820278603');

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      this.data = 'http:' + response.body;
    });
  }


  _getHttpClient() async {
    var httpClient = HttpClient();
    // var uri = Uri(
    //     scheme: 'https',
    //     host: 'blog.csdn.net',
    //     path: 'liwenjie0912/article/details/113844115');
    var uri = Uri(
      scheme: 'http',
      host: 'tcc.taobao.com',
      path: 'cc/json/mobile_tel_segment.htm',
      queryParameters:{
        'tel': '15820278603',
      }
    );
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    String responseBody = await response.toString();
    print('$responseBody');
    // String responseBody = await response.transform(utf8.decoder).join();
    setState(() {
      this.data = responseBody;
    });
  }
}


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

                Navigator.of(context).pushNamed('/three');
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
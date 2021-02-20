import 'package:flutter/material.dart';
import 'package:flutter_demo/CheckBoxPage.dart';
import 'package:flutter_demo/DemoPage.dart';
import 'package:flutter_demo/DemoWidget.dart';
import 'package:flutter_demo/ImagePage.dart';
import 'package:flutter_demo/ListPage.dart';
import 'package:flutter_demo/PageViewPage.dart';
import 'package:flutter_demo/RandomWords.dart';
import 'package:flutter_demo/Rote/FivePage.dart';
import 'package:flutter_demo/Rote/FourPage.dart';
import 'package:flutter_demo/Rote/HomePage.dart';
import 'package:flutter_demo/RowColumnWidget.dart';
import 'package:flutter_demo/SettingPage.dart';
import 'package:flutter_demo/SliverAppBarPage.dart';
import 'package:flutter_demo/TestPage.dart';
import 'package:flutter_demo/WrapPage.dart';
import 'package:flutter_demo/MyFlowDelegate.dart';

import 'Rote/HomePage.dart';
import 'Rote/TwoPage.dart';
import 'Rote/ThreePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();

    // return SliverAppBarPage();

    return MaterialApp(
      title: 'welcome',
      routes: <String, WidgetBuilder> {
        '/home': (context) => HomePage(),
        '/two': (context) => TwoPage(),
        '/three': (context) => ThreePage(),
        '/four': (context) => FourPage(),
        '/five': (context) => FivePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      color: Colors.white,

      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

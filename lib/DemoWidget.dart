import 'package:flutter/material.dart';

class DemoWidget extends StatefulWidget {
  @override
  _DemoWidgetState createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget'),
      ),
      body:

      Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 80,
                      color: Colors.green,
                    ))
              ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 100.0,
                child: Flex(
                  direction: Axis.vertical,
                  children: [

                    Expanded(
                      flex: 2,
                        child: Container(
                          height: 30.0,
                          color: Colors.red,
                        )
                    ),
                    Spacer(
                      flex: 1,

                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 30.0,
                          color: Colors.blue,
                        )
                    )
                  ],
                ),
              ),
          ),


          // Text('data'),
          // Text('data2'),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('hello word'),
          //     Text('I am  xixi'),
          //   ],
          // ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(" hello world "),
          //     Text(" I am Jack "),
          //   ],
          // ),
          Wrap(
            spacing: 8.0,
            alignment: WrapAlignment.center,
            runSpacing: 4.0,
            runAlignment: WrapAlignment.start,
            children: [
              Chip(label: Text('xixi1'), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A'))),
              Chip(label: Text('xixi2' * 2), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('B'))),
              Chip(label: Text('xixi3' * 3), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('C'))),
              Chip(label: Text('xixi4' * 4), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('D'))),
            ],
          ),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo/DrawBoard.dart';
import 'package:flutter_demo/MyFlowDelegate.dart';
import 'package:flutter_demo/ButtonCase.dart';

class WarpFlexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Container(
          child: _buildDraw(),
        ));
  }
}

Widget _buildMyFLow() {
  return Flow(
    delegate: MyFlowDelegate(margin: EdgeInsets.all(10.0)),
    children: [
      Container(
        width: 100.0,
        height: 80.0,
        color: Colors.red,
      ),
      Container(
        width: 80.0,
        height: 80.0,
        color: Colors.green,
      ),
      Container(
        width: 80.0,
        height: 90.0,
        color: Colors.blue,
      ),
      Container(
        width: 80.0,
        height: 80.0,
        color: Colors.yellow,
      ),
      Container(
        width: 80.0,
        height: 100.0,
        color: Colors.brown,
      ),
      Container(
        width: 80.0,
        height: 80.0,
        color: Colors.purple,
      ),
    ],
  );
}

Widget _buildStack() {
  return Stack(
    fit: StackFit.loose,
    overflow: Overflow.visible,
    alignment: AlignmentDirectional.center,
    children: [
      Container(
        height: 200.0,
        width: 200.0,
        color: Colors.red,
      ),
      Container(
        height: 170.0,
        width: 170.0,
        color: Colors.purple,
      ),
      Positioned(
          left: 100.0,
          //   right: 100.0,
          top: 10.0,
          child: Container(
            height: 140.0,
            width: 140.0,
            color: Colors.blue,
          ))
    ],
  );
}

Widget _buildPadding() {
  return Padding(
    padding: EdgeInsets.all(6.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 8.0), child: Text('hello')),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text('hello 2')),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          child: Text("heloo 3"),
        )
      ],
    ),
  );
}

Widget _buildContainer() {
  return Container(
      color: Colors.blue,
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: NetworkImage(
            //       'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            //   fit: BoxFit.cover,
            // ),
            shape: BoxShape.rectangle,
            color: Colors.yellowAccent,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(color: Colors.red, width: 2)),
        // color: Colors.red,
        height: 100.0,
        width: 300.0,
        // transform: Matrix4.translationValues(90.0, 30.0, 100.0),
        transform: Matrix4.rotationX(10.0),
        child: Text(
          '我是xixi',
          style: TextStyle(fontSize: 30.0),
        ),
      ));
}

Widget _buildSizedBox() {
  return Column(
    children: [
      Container(
        height: 30.0,
        color: Colors.blue,
      ),
      SizedBox(
        height: 30.0,
      ),
      Container(
        height: 30.0,
        color: Colors.red,
      ),
      SizedBox(
        height: 40.0,
        child: Text('我是123'),
      ),
    ],
  );
}

Widget _buildAspectRatio() {
  return Container(
    height: 200.0,
    width: 150.0,
    alignment: Alignment.center,
    color: Colors.blue,
    child: AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        color: Colors.red,
      ),
    ),
  );
}

Widget _buildFractionallySizedBox() {
  return Container(
    height: 200.0,
    width: 150.0,
    color: Colors.blue,
    alignment: Alignment.topCenter,
    child: FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 0.4,
      child: Container(
        color: Colors.orange,
      ),
    ),
  );
}

Widget _buildFlexExpandedSpacer() {
  return Row(
    children: [
      // //中间霸占全部
      // Container(
      //   color: Colors.blue,
      //   height: 50.0,
      //   width: 100.0,
      // ),
      // Flexible(child: Container(
      //   color: Colors.red,
      //   height: 40.0,
      // )),
      // Container(
      //   color: Colors.purple,
      //   height: 50.0,
      //   width: 40.0,
      // ),

      //中间霸占全部
      Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Container(
          color: Colors.blue,
          height: 50.0,
        ),
      ),
      Expanded(
        flex: 3,
        child: GestureDetector(

          // onTap: () {
            // print("tap GestureDetector");
          // },
            child: OutlineButton(
              child: Text('我是button'),
              onPressed: () {
                print("点击了button");
              },
            )
        ),
      ),
      // Flexible(
      //     flex: 3,
      //     child: Container(
      //       child: Text('xixi'),
      //       alignment: Alignment.center,
      //       color: Colors.red,
      //       height: 30.0,
      // )),
      Flexible(
        flex: 2,
        child: GestureDetector(

          onDoubleTap: () {
            print('print onDoubleTap');
          },
          onTap: () {
            print("点击了");
          },
          // onTapDown: (TapDownDetails details) {
          //   print('onTapDown' + details.globalPosition.toString() + details.localPosition.toString());
          // },
          // onTapUp: (TapUpDetails details) {
          //   print('onTapUp' + details.globalPosition.toString() + details.localPosition.toString());
          // },
          // onTapCancel: () {
          //   print('onTapCancel');
          // },
          child: Container(
            color: Colors.purple,
            height: 50.0,
          ),
        ),
      )
    ],
  );
}

Widget _buildButtonCase() {
  return Center(
    child: ButtonCase(),
  );
}

Widget _buildDraw() {
  return DrawBoard();
}
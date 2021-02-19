import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  @override
  _PageViewPageState createState() => _PageViewPageState();
}


Widget _buildSliverList() {
  return CustomScrollView(slivers: <Widget>[
    SliverAppBar(
      pinned: true,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('xixihah'),
        background: Image.network('http://img.haote.com/upload/20180918/2018091815372344164.jpg',
          fit: BoxFit.fitHeight,),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate((content, index) {
        return Container(
          height: 65,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      }, childCount: 5),
    ),
    SliverPadding(padding: EdgeInsets.all(5.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            color: Colors.primaries[index % Colors.primaries.length],
          );
        }, childCount: 10),
      ),),

    SliverList(
      delegate: SliverChildBuilderDelegate((content, index) {
        return Container(
          height: 65,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      }, childCount: 2),
    ),
  ]);
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    return _buildSliverList();
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('xixi'),
    //     ),
    //     body: _buildSliverList(),
    //   ),
    // );
  }



  Widget _buildPageOne() {
    return PageView(
      onPageChanged: (int index) {
        print('当前是： $index');
      },
      controller: PageController(
        viewportFraction: 0.8,
        initialPage: 1,
      ),
      children: [
        myPage(Colors.red),
        myPage(Colors.yellowAccent),
        myPage(Colors.greenAccent),
      ],
    );
  }

  Widget myPage(Color color) {
    return Container(
      color: color,
      height: 200.0,
    );
  }
}

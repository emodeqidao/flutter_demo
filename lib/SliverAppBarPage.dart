import 'package:flutter/material.dart';

class SliverAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _buildSliverList(),
    );
  }
}

Widget _buildSliverList() {
  return CustomScrollView(slivers: <Widget>[
    SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('xixihah'),
        // centerTitle: true,
        // collapseMode: CollapseMode.pin,
        background: Image.network('http://img.haote.com/upload/20180918/2018091815372344164.jpg',
          fit: BoxFit.fitHeight,),
      ),
    ),
    SliverFixedExtentList(
      itemExtent: 40.0,

      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {

          return Card(

            child: Container(
              alignment: Alignment.center,
              color: Colors.primaries[(index % 18)],
              child: Text(''),
            ),
          );
        }, childCount: 10,
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

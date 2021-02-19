import 'package:flutter/material.dart';


class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController;
  
  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController()
    ..addListener(() {  
      print('${_scrollController.position}');
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   buttonColor: Colors.blue,
      //   buttonTheme: ButtonThemeData(
      //     buttonColor: Colors.blue
      //   ),
      //   primaryColor: Colors.blue
      // ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: _buildGridViewTwo(),
        )
    );
  }
  
  Widget _buildGridViewTwo() {
    return GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: 2 / 1,
        ), 
        itemBuilder: (BuildContext context, int index) {
          return _createGridViewItem(Colors.primaries[index % Colors.primaries.length]);
        },
        itemCount: 20,
    );
  }

  Widget _buildGridViewOne() {
    return GridView(
      reverse: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 2 / 1,
      ),
      children: [
        _createGridViewItem(Colors.primaries[0]),
        _createGridViewItem(Colors.primaries[1]),
        _createGridViewItem(Colors.primaries[2]),
        _createGridViewItem(Colors.primaries[3]),
        _createGridViewItem(Colors.primaries[4]),
        _createGridViewItem(Colors.primaries[5]),
        _createGridViewItem(Colors.primaries[6]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
        _createGridViewItem(Colors.primaries[7]),
      ],
    );
  }

  _createGridViewItem(Color color) {
    return Container(
      height: 80,
      color: color,
    );
  }

  Widget _buildListViewTwo() {
    return Column(
      children: [
        Container(
          child: RaisedButton(
            color: Colors.red,
            // height: 44.0,
            // minWidth: 200.0,
            child: Text('jump'),
            onPressed: () {
              _scrollController.animateTo(200, duration: Duration(milliseconds: 300), curve: Curves.linear);
            },
          ),
        ),
        Expanded(
            child: ListView.separated(
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return _ListItem(title: '$index',);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.red,
                  thickness: 3,
                  height: 5,
                );
              },
              itemCount: 30,
              reverse: true,
              scrollDirection: Axis.vertical,
            )
        )
      ],
    );
  }
}


Widget _buildListViewOne() {
  return ListView.builder(
      itemBuilder:(BuildContext context, int index) {
        return _ListItem(title: '$index',);
        },
    itemExtent: 40,
    itemCount: 10,
  );
}


class _ListItem extends StatelessWidget {
  final String title;

  const _ListItem({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Text('$title', style: TextStyle(fontSize: 20.0),),
      )
    );
  }
}

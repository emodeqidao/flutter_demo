import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
  SavePage({
    Key key,
    @required this.dataSource,
  }) : super(key: key);
  final Set dataSource;

  @override
  Widget build(BuildContext context) {
    
    final tiles = this.dataSource.map(
      (pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: TextStyle(fontSize: 20.0),
          ),
        );
      },
    );
    
    print('${this.dataSource}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
    );
  }

  Widget _row(WordPair wordPair) {
    return ListTile(
      title: Text(wordPair.asPascalCase),
      tileColor: Colors.lightBlue,
    );
  }
}


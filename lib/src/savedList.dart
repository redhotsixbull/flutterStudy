

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedList extends StatefulWidget {

  SavedList({@required this.saved});

  final Set<WordPair> saved;

  @override
  _SavedListState createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved"),
      ),
      body: _buildList(widget.saved),
    );
  }

  Widget _buildList(Set<WordPair> saved) {
    return ListView.builder(
        itemCount: saved.length * 2, itemBuilder: (context, index) {
      // 짝수는 - 아이템
      // 홀수는 - divider 구분선같은거가?
      var number = index ~/ 2;
      if (index.isOdd) {
        return Divider();
      } else {
        return _buildRow(saved.toList()[number]);
      }

      //return Text(_suggestion[realIndex].asPascalCase, textScaleFactor: 1.5);
    });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, textScaleFactor: 1.5,),
      onTap: () {
        setState(() {
          widget.saved.remove(pair);
        });
      },
    );
  }
}
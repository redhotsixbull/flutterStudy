import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'savedList.dart';
class RandomList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  final List<WordPair> _suggestion = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("StudyApp"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.list),
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder:(context)=>SavedList(saved:_saved))
              );
            },
          )
        ],
      ),
      // ignore: missing_return
      body: _buildList()  //아래에있는 Widget 을 호출하는 방식   이런방식이라면... 위젯 라이브러리를 가져와서 그대로 붙여넣는식으로 작업도가능하겠네 플러터짱짱
    );
  }


  Widget _buildList(){
    return ListView.builder(itemBuilder: (context, index) {
      // 짝수는 - 아이템
      // 홀수는 - divider 구분선같은거가?
      if (index.isOdd) {
        return Divider();
      }
      var realIndex = index ~/ 2;
      if (realIndex >= _suggestion.length) {
        _suggestion.addAll(generateWordPairs().take((10)));
      }
      return _buildRow(_suggestion[realIndex]);
      //return Text(_suggestion[realIndex].asPascalCase, textScaleFactor: 1.5);
    });
  }
  Widget _buildRow(WordPair pair){
    final bool saved = _saved.contains(pair);
    return ListTile(
      title:Text(
      pair.asPascalCase,
      textScaleFactor: 1.5,
      ),
      trailing: Icon(
        saved? Icons.favorite:Icons.favorite_border,
      color: Colors.pink,
      ),
      onTap: (){
        setState(() {

        click(pair, saved);
        });
    },
    );
  }
  void click(WordPair pair,bool saved){
    if(saved){
      _saved.remove(pair);
    }else{
      _saved.add(pair);
    }

    return print(_saved.toString());
  }

}

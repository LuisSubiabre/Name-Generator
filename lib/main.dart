import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(Screen());

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Flutter Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Name Generator', style: TextStyle(color: Colors.blueGrey),),
        ),
        body: RandomWords(),
        ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _styleFont = const TextStyle(fontSize: 18.0, color: Colors.amber);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.6),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, style: _styleFont,),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

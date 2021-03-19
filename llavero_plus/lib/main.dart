import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      title: 'Generar Palabras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize:18.0);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title: Row(
          children: <Widget>[
            Text('Generador de palabras'),
            MyButton()
          ]
        )
      ),
      body: _buildSuggestions()
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if (i.isOdd) return Divider();

        final index = i ~/2;
        if (index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));          
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont
      )
    );
  }
}


class MyButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        _showDialog(context);        
      },
      child: Container(
        height: 28.0,
        padding: const EdgeInsets.symmetric(horizontal:10.0, vertical:2.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]
        ),
        child: Center(
          child: Text('Presioname',style:TextStyle(fontSize: 15.0)),
        )
      )
    );
  }

  void _showDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Hola mundo'),
        );
      }
    );
  }
}
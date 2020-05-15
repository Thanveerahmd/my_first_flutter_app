import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/result.dart';
import 'quize.dart';

// void main() {
//   runApp(MyFirstApp());
// }

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  var _quectionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'what is your favourite colour ?',
      'answers': [
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Black', 'score': 10}
      ]
    },
    {
      'questionText': 'what is your favourite animal ?',
      'answers': [
        {'text': 'Cat', 'score': 2},
        {'text': 'Dog', 'score': 3},
        {'text': 'Elephant', 'score': 8},
        {'text': 'Ant', 'score': 7}
      ]
    },
    {
      'questionText': 'what is your favourite Subject ?',
      'answers': [
        {'text': 'Maths', 'score': 1},
        {'text': 'Science', 'score': 3},
        {'text': 'Arts', 'score': 10},
        {'text': 'Law', 'score': 8}
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _quectionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    if (_quectionIndex < _questions.length) {
      setState(() {
        _quectionIndex = _quectionIndex + 1;
      });
    } else {
      print('Quiz is over');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quize App'),
        ),
        body: _quectionIndex < _questions.length
            ? Quize(
                answerQuestions: _answerQuestions,
                quectionIndex: _quectionIndex,
                questions: _questions,
              )
            : Center(
                child: Result(_totalScore,_resetQuiz),
              ),
      ),
    );
  }
}

// Diffrent methods of creating buttons

/*
            // method 1
            RaisedButton(child: Text('Answer 1'), onPressed: _answerQuestions),
            // method 2
            RaisedButton(
                child: Text('Answer 2'),
                onPressed: () => print('answer 2 selected')),
            // method 3
            RaisedButton(
                child: Text('Answer 3'),
                onPressed: () {
                  print('answer 3 selected');
                  setState(() {
                    _quectionIndex++;
                  });
                }),*/

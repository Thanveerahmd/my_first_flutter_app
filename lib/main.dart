import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/quection.dart';

import 'answer.dart';

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

  void _answerQuestions() {
    print('answer 1 selected');

    if (_quectionIndex > 1) {
      print('Quiz is over');
    } else {
      setState(() {
        _quectionIndex = _quectionIndex + 1;
      });
      print(_quectionIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    // var questions = [
    //   'what is your favourite colour ?',
    //   'what is your favourite animal ?'
    // ];

    var questions = [
      {
        'questionText': 'what is your favourite colour ?',
        'answers': ['Red', 'Green', 'Blue', 'Black']
      },
      {
        'questionText': 'what is your favourite animal ?',
        'answers': ['Cat', 'Dog', 'Elephant', 'Ant']
      },
      {
        'questionText': 'what is your favourite Subject ?',
        'answers': ['Maths', 'Science', 'Arts', 'Law']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quize App'),
        ),
        body: Column(
          children: [

            Quection(questions[_quectionIndex]['questionText']),

            // In this senario spread oprator (...) or 3 dots task is to pull all the values 
            // in the list and  use it as indivual value for the sourronding list (children[])
        
            ...(questions[_quectionIndex]['answers'] as List<String>)
                .map((answer) => Answer(_answerQuestions, answer))
                .toList()

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
          ],
        ),
      ),
    );
  }
}

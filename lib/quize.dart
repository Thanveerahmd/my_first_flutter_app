import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/answer.dart';
import 'package:my_first_flutter_app/quection.dart';

class Quize extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestions;
  final int quectionIndex;

  Quize(
      {@required this.answerQuestions,
      @required this.questions,
      @required this.quectionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Quection(questions[quectionIndex]['questionText']),

        // In this senario spread oprator (...) or 3 dots task is to pull all the values
        // in the list and  use it as indivual value for the sourronding list (children[])

        ...(questions[quectionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(() => answerQuestions(answer['score']), answer['text']))
            .toList()
      ],
    );
  }
}

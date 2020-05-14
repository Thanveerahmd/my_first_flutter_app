import 'package:flutter/material.dart';

class Quection extends StatelessWidget {
  final String quectionText;

  Quection(this.quectionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: Text(
        quectionText,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}

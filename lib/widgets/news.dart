// ignore_for_file: camel_case_types
// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:blinking_text/blinking_text.dart';

class news extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(child: BlinkText('No News Found',
          beginColor: Colors.black,
          endColor: Colors.greenAccent,
          duration: Duration(milliseconds: 500),
          style: TextStyle(fontSize: 25))),
    );
  }
}
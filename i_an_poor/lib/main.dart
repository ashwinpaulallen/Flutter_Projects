import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text('I am Poor'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Center(
          child: Image(image: AssetImage('images/coal.png')),
        ),
      ),
    ),
  ));
}

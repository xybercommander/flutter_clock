import 'package:flutter/material.dart';
import 'package:flutter_clock/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clock',
      theme: ThemeData(      
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
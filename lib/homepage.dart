import 'package:flutter/material.dart';
import 'package:flutter_clock/clockview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color.fromRGBO(39, 41, 58, 1),
        child: ClockView(),
      ),
    );
  }
}
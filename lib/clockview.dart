import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()
    ..color = Color(0xFF3d3e6a);

    var outlineBrush = Paint()
    ..color = Color(0xFFEAEcff)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 16;

    var centerFillBrush = Paint()
    ..color = Color(0xFFEAEcff);

    canvas.drawCircle(center, radius - 30, fillBrush);
    canvas.drawCircle(center, radius - 30, outlineBrush);
    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    // ------------ALL THE CIRCLE PAINTBRUSHES------------ //
    var fillBrush = Paint()
    ..color = Color(0xFF3d3e6a);

    var outlineBrush = Paint()
    ..color = Color(0xFFEAEcff)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 16;

    var centerFillBrush = Paint()
    ..color = Color(0xFFEAEcff);

    // ------------ALL THE CLOCK HAND PAINTBRUSHES------------ //
    var secHandBrush = Paint()
    ..color = Colors.orange[300]
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 6;

    var minHandBrush = Paint()
    ..shader = RadialGradient(colors: [Color(0xFF748ef6), Color(0xff77ddff)])
        .createShader(Rect.fromCircle(center: center, radius: radius))
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 8;

    var hourHandBrush = Paint()
    ..shader = RadialGradient(colors: [Color(0xFFea74ab), Color(0xffc279fb)])
        .createShader(Rect.fromCircle(center: center, radius: radius))
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 12;

    var dashBrush = Paint()
    ..color = Colors.blueGrey[500]
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;


    // ------------------ALL THE CANVAS------------------ //
    canvas.drawCircle(center, radius - 30, fillBrush);
    canvas.drawCircle(center, radius - 30, outlineBrush);    

    var hourHandX = centerX + 60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX + 60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 78 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 78 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);    
    
    canvas.drawCircle(center, 16, centerFillBrush);

    var outerCircleRadius = radius + 8;
    var innerCircleRadius = radius - 5;
    for(int i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
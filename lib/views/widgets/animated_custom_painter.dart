import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedCustomPainter extends CustomPainter {
  final DateTime dateTime;

  AnimatedCustomPainter({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var radius = min(size.width / 2, size.height / 2);

    /// main circle
    Paint mainCircleBrush = Paint()..color = const Color(0xFF414673);

    /// white circle in center
    Paint littleCircleBrush = Paint()..color = Colors.white;

    /// border of clock
    Paint clockBorderBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    /// second  of clock
    Paint secondBrush = Paint()
      ..color = const Color(0xFFF9B94B)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    /// minute  of clock
    Paint minuteBrush = Paint()
      ..color = const Color(0xFF709BEC)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    /// hour of clock
    Paint hourBrush = Paint()
      ..color = const Color(0xFFE66C6C)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14;

    /// draw main circle
    canvas.drawCircle(center, radius, mainCircleBrush);

    /// draw clock border
    canvas.drawCircle(center, radius, clockBorderBrush);

    /// draw hour hand
    var hourHandX = center.dx +
        radius *
            0.5 *
            cos((dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180);
    var hourHandY = center.dy +
        radius *
            0.5 *
            sin((dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourBrush);

    /// draw minute hand
    var minuteHandX =
        center.dx + radius * 0.7 * cos(dateTime.minute * 6 * pi / 180);
    var minuteHandY =
        center.dy + radius * 0.7 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), minuteBrush);

    /// draw second hand
    var secondHandX =
        center.dx + radius * 0.9 * cos(dateTime.second * 6 * pi / 180);
    var secondHandY =
        center.dy + radius * 0.9 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondBrush);

    /// draw center dot
    canvas.drawCircle(center, 10, littleCircleBrush);

    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    var centerX = size.width / 2;
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

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

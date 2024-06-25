import 'dart:async';
import 'dart:math';

import 'package:clock_custom_paint/views/widgets/animated_custom_painter.dart';
import 'package:clock_custom_paint/views/widgets/clock_with_number.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _dateTime = DateTime.now();
  int _hour = DateTime.now().hour;
  int _minute = DateTime.now().minute;
  int _second = DateTime.now().second;

  @override
  void initState() {
    super.initState();
    _hour = _dateTime.hour;
    _minute = _dateTime.minute;
    _second = _dateTime.second;
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        _dateTime = DateTime.now();

        _hour = _dateTime.hour;
        _minute = _dateTime.minute;
        _second = _dateTime.second;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock using CustomPaint'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform.rotate(
              angle: -pi / 2,
              child: CustomPaint(
                size: const Size(200, 200),
                painter: AnimatedCustomPainter(dateTime: _dateTime),
              ),
            ),
            ClockWithNumber(
              hour: _hour,
              minute: _minute,
              second: _second,
            ),
          ],
        ),
      ),
    );
  }
}

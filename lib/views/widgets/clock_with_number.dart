import 'package:flutter/material.dart';

class ClockWithNumber extends StatelessWidget {
  final int hour;
  final int minute;
  final int second;

  const ClockWithNumber({
    super.key,
    required this.hour,
    required this.minute,
    required this.second,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${timeFormatter(hour)}:${timeFormatter(minute)}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          const Text(
            ':',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          Text(
            timeFormatter(second),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

  String timeFormatter(int formatTime) {
    if (formatTime <= 9) {
      return '0$formatTime';
    }
    return '$formatTime';
  }
}

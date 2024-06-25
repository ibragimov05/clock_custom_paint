// import 'dart:async';
// import 'dart:math';
//
// import 'package:clock_custom_paint/views/widgets/animated_custom_painter.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   DateTime _dateTime = DateTime.now();
//   late int hour;
//   late int minute;
//   late int second;
//
//   @override
//   void initState() {
//     super.initState();
//     hour = _dateTime.hour;
//     minute = _dateTime.minute;
//     second = _dateTime.second;
//     Timer.periodic(
//       const Duration(seconds: 1),
//       (Timer timer) {
//         _dateTime = DateTime.now();
//
//         hour = _dateTime.hour;
//         minute = _dateTime.minute;
//         second = _dateTime.second;
//         setState(() {});
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Clock using CustomPaint'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Transform.rotate(
//               angle: -pi / 2,
//               child: CustomPaint(
//                 size: const Size(200, 200),
//                 painter: AnimatedCustomPainter(dateTime: _dateTime),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.white,
//                 )
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "$hour:$minute",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 30,
//                     ),
//                   ),
//                   Text(
//                     ':',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 30,
//                     ),
//                   ),
//                   Text(
//                     second.toString(),
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 30,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
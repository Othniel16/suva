import 'package:flutter/material.dart';
import 'package:suva/app.dart';

void main() {
  runApp(const App());
}



// SizedBox(
//                     height: 60.0,
//                     child: Marquee(
//                       text: 'Some sample text that takes some space.',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                       scrollAxis: Axis.horizontal,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       blankSpace: 20.0,
//                       velocity: 50.0,
//                       // pauseAfterRound: Duration(seconds: 1),
//                       startPadding: 10.0,
//                       accelerationDuration: const Duration(seconds: 1),
//                       accelerationCurve: Curves.linear,
//                       decelerationDuration: const Duration(milliseconds: 0),
//                       decelerationCurve: Curves.easeOut,
//                     ),
//                   ),


// AnalogClock(
//                     width: 150.0,
//                     height: 150.0,
//                     isLive: true,
//                     showTicks: true,
//                     showNumbers: false,
//                     textScaleFactor: 1.4,
//                     showDigitalClock: false,
//                     datetime: DateTime.now(),
//                     tickColor: Colors.grey[300],
//                     secondHandColor: Colors.greenAccent,
//                   ),
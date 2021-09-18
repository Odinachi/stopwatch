import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/center_nob.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';
import 'package:stopwatch_flutter/ui/clock_marker.dart';
import 'package:stopwatch_flutter/ui/custom_button.dart';

import 'elapsed_time_text.dart';

class StopWatchRenderer extends StatelessWidget {
  StopWatchRenderer(
      {Key? key,
      required this.elasped,
      required this.radius,
      required this.resetCallback,
      required this.startCallback,
      required this.startState,
      required this.onpause})
      : super(key: key);
  final Duration elasped;
  final double radius;
  VoidCallback startCallback;
  VoidCallback resetCallback;
  bool startState;
  VoidCallback onpause;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(left: radius, top: radius, child: CenterNob()),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
            top: radius,
            left: radius,
            child: ClockTextMarker(value: i, maxValue: 60, radius: radius),
          ),
        for (var i = 0; i < 60; i++)
          Positioned(
              left: radius,
              top: radius,
              child: ClockMarker(radius: radius, seconds: i)),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
              rotateZ: pi + (2 * pi / 60000) * elasped.inMilliseconds,
              thickness: 2,
              handLength: radius - 20,
              color: Colors.red),
        ),
        // Transform
        // (
        //   transform: Matrix4.identity()
        //     ..translate(50.0, 0.0, 0.0)
        //     ..rotateZ(pi / 4),
        //   alignment: Alignment.center,
        //   child: Container(
        //     color: Colors.pisnk,
        //   ),
        // )
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elasped,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                  color: Colors.red, onpress: resetCallback, text: 'Reset'),
              CustomButton(
                  color: startState ? Colors.grey : Colors.green,
                  onpress: startState ? onpause : startCallback,
                  text: startState ? 'Pause' : 'Start'),
            ],
          ),
        )
      ],
    );
  }
}

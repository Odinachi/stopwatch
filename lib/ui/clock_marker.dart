import 'dart:math';

import 'package:flutter/material.dart';

class ClockMarker extends StatelessWidget {
  const ClockMarker({Key? key, required this.radius, required this.seconds})
      : super(key: key);
  final double radius;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final Color color = seconds % 5 == 0 ? Colors.white : Colors.grey.shade700;
    const width = 3.0;
    const height = 12.0;
    return Transform(
        transform: Matrix4.identity()
          ..translate(-width / 2, -height / 2, 0)
          ..rotateZ(2 * pi * (seconds / 60))
          ..translate(0.0, radius - height / 2, 0.0),
        alignment: Alignment.center,
        child: Container(
          height: height,
          width: width,
          color: color,
        ));
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker({
    Key? key,
    required this.value,
    required this.maxValue,
    required this.radius,
  }) : super(key: key);
  final int value;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const height = 30.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          value.toString(),
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

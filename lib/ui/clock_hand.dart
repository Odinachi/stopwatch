import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  const ClockHand(
      {Key? key,
      required this.rotateZ,
      required this.thickness,
      required this.handLength,
      required this.color})
      : super(key: key);
  final double rotateZ;
  final double thickness;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(-thickness / 2, 0.0, 0.0)
        ..rotateZ(rotateZ),
      alignment: Alignment.topCenter,
      child: Container(
        height: handLength,
        color: color,
        width: thickness,
      ),
    );
  }
}

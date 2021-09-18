import 'dart:math';

import 'package:flutter/material.dart';

class CenterNob extends StatelessWidget {
  const CenterNob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const width = 20.0;
    const height = 20.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0)
        ..rotateZ(2 * pi * (1 / 60)),
      child: Container(
        width: 20,
        height: 20,
        decoration:
            BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
      ),
    );
  }
}

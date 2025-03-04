import 'package:flutter/material.dart';

class RedDot extends StatelessWidget {
  final Color color;
  final Size size;
  final double radius;

  const RedDot(
      {super.key,
      this.color = Colors.red,
      this.size = const Size(8.0, 8.0),
      this.radius = 4.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
    );
  }
}

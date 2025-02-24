import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  final double height;
  final double width;
  final BoxDecoration? decoration;
  final Color color;

  const CustomVerticalDivider({
    super.key,
    required this.height,
    required this.color,
    required this.width,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      decoration: decoration,
    );
  }
}

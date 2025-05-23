import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final Widget? child;
  final Color color;
  final Color borderColor;

  const CircleContainer({
    super.key,
    required this.color,
    required this.borderColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(width: 2, color: borderColor),
      ),
      child: Center(child: child),
    );
  }
}

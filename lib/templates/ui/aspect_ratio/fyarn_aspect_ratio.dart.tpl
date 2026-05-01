import 'package:flutter/material.dart';

class FyarnAspectRatio extends StatelessWidget {
  final double ratio;
  final Widget child;
  final BorderRadius? borderRadius;

  const FyarnAspectRatio({
    super.key,
    this.ratio = 1.0,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: ratio,
      child: borderRadius != null
          ? ClipRRect(
              borderRadius: borderRadius!,
              child: child,
            )
          : child,
    );
  }
}




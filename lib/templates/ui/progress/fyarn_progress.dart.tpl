import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnProgress extends StatelessWidget {
  final double value; // 0.0 to 1.0

  const FyarnProgress({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Container(
      height: 8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: fy.colors.secondary,
        borderRadius: BorderRadius.circular(fy.shapes.full),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: value.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: fy.colors.primary,
            borderRadius: BorderRadius.circular(fy.shapes.full),
          ),
        ),
      ),
    );
  }
}




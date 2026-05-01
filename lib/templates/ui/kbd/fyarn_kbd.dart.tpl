import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnKbd extends StatelessWidget {
  final String text;

  const FyarnKbd({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fy.spacing.xs, vertical: 2),
      decoration: BoxDecoration(
        color: fy.colors.muted,
        borderRadius: BorderRadius.circular(fy.shapes.sm),
        border: Border.all(color: fy.colors.border),
      ),
      child: Text(
        text,
        style: fy.typography.labelMedium.copyWith(
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
          color: fy.colors.mutedForeground,
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnLabel extends StatelessWidget {
  final String text;

  const FyarnLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Text(
      text,
      style: fy.typography.labelMedium.copyWith(
        fontWeight: FontWeight.w600,
        color: fy.colors.foreground,
      ),
    );
  }
}




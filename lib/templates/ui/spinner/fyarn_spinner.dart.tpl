import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnSpinner extends StatelessWidget {
  final double size;
  final Color? color;

  const FyarnSpinner({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? fy.colors.primary),
      ),
    );
  }
}




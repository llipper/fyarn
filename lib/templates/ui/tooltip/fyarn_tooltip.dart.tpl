import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const FyarnTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: fy.colors.popover,
        borderRadius: BorderRadius.circular(fy.shapes.sm),
        border: Border.all(color: fy.colors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      textStyle: fy.typography.labelMedium.copyWith(color: fy.colors.popoverForeground),
      child: child,
    );
  }
}




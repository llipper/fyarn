import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnHoverCard extends StatelessWidget {
  final Widget trigger;
  final Widget content;

  const FyarnHoverCard({
    super.key,
    required this.trigger,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Tooltip(
      richMessage: WidgetSpan(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(fy.spacing.md),
          decoration: BoxDecoration(
            color: fy.colors.card,
            borderRadius: BorderRadius.circular(fy.shapes.lg),
          ),
          child: DefaultTextStyle(
            style: fy.typography.bodySmall.copyWith(color: fy.colors.foreground),
            child: content,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: fy.colors.card,
        borderRadius: BorderRadius.circular(fy.shapes.lg),
        border: Border.all(color: fy.colors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: trigger,
    );
  }
}




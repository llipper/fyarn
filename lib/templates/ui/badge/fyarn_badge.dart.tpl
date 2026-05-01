import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';
import '../text/fyarn_text.dart';

enum FyarnBadgeVariant { primary, secondary, outline, destructive }

class FyarnBadge extends StatelessWidget {
  final String text;
  final FyarnBadgeVariant variant;

  const FyarnBadge({
    super.key,
    required this.text,
    this.variant = FyarnBadgeVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    Color backgroundColor;
    Color foregroundColor;
    BorderSide border = BorderSide.none;

    switch (variant) {
      case FyarnBadgeVariant.primary:
        backgroundColor = fy.colors.primary;
        foregroundColor = fy.colors.onPrimary;
        break;
      case FyarnBadgeVariant.secondary:
        backgroundColor = fy.colors.secondary;
        foregroundColor = fy.colors.onSecondary;
        break;
      case FyarnBadgeVariant.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = fy.colors.foreground;
        border = BorderSide(color: fy.colors.border);
        break;
      case FyarnBadgeVariant.destructive:
        backgroundColor = fy.colors.error;
        foregroundColor = fy.colors.onError;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: fy.spacing.xs, 
        vertical: fy.spacing.xxs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(fy.shapes.full),
        border: Border.fromBorderSide(border),
      ),
      child: FyarnText(
        text: text,
        variant: FyarnTextVariant.labelSmall,
        color: foregroundColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}



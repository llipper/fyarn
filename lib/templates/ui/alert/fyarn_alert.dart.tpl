import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

enum FyarnAlertVariant { info, success, warning, destructive }

class FyarnAlert extends StatelessWidget {
  final String title;
  final String description;
  final FyarnAlertVariant variant;
  final IconData? icon;

  const FyarnAlert({
    super.key,
    required this.title,
    required this.description,
    this.variant = FyarnAlertVariant.info,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    Color backgroundColor;
    Color borderColor;
    Color iconColor;
    IconData displayIcon;

    switch (variant) {
      case FyarnAlertVariant.info:
        backgroundColor = fy.colors.primaryContainer.withValues(alpha: 0.1);
        borderColor = fy.colors.primary.withValues(alpha: 0.2);
        iconColor = fy.colors.primary;
        displayIcon = Icons.info_outline;
        break;
      case FyarnAlertVariant.success:
        backgroundColor = fy.colors.success.withValues(alpha: 0.1);
        borderColor = fy.colors.success.withValues(alpha: 0.2);
        iconColor = fy.colors.success;
        displayIcon = Icons.check_circle_outline;
        break;
      case FyarnAlertVariant.warning:
        backgroundColor = fy.colors.warning.withValues(alpha: 0.1);
        borderColor = fy.colors.warning.withValues(alpha: 0.2);
        iconColor = fy.colors.warning;
        displayIcon = Icons.warning_amber_outlined;
        break;
      case FyarnAlertVariant.destructive:
        backgroundColor = fy.colors.error.withValues(alpha: 0.1);
        borderColor = fy.colors.error.withValues(alpha: 0.2);
        iconColor = fy.colors.error;
        displayIcon = Icons.error_outline;
        break;
    }

    return Container(
      padding: EdgeInsets.all(fy.spacing.md),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: fy.shapes.borderRadiusMd,
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon ?? displayIcon, color: iconColor, size: 20),
          SizedBox(width: fy.spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: fy.typography.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: fy.colors.foreground,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: fy.typography.bodySmall.copyWith(
                    color: fy.colors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




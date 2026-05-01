import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnSonner extends StatelessWidget {
  final String message;
  final String? description;
  final Widget? action;
  final IconData? icon;

  const FyarnSonner({
    super.key,
    required this.message,
    this.description,
    this.action,
    this.icon,
  });

  static void show(
    BuildContext context, {
    required String message,
    String? description,
    Widget? action,
    IconData? icon,
  }) {
    final fy = context.fy;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        content: FyarnSonner(
          message: message,
          description: description,
          action: action,
          icon: icon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Container(
      padding: EdgeInsets.all(fy.spacing.md),
      decoration: BoxDecoration(
        color: fy.colors.card,
        borderRadius: BorderRadius.circular(fy.shapes.lg),
        border: Border.all(color: fy.colors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: fy.colors.primary, size: 20),
            SizedBox(width: fy.spacing.sm),
          ],
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: fy.typography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (description != null)
                  Text(
                    description!,
                    style: fy.typography.bodySmall.copyWith(
                      color: fy.colors.mutedForeground,
                    ),
                  ),
              ],
            ),
          ),
          if (action != null) ...[SizedBox(width: fy.spacing.md), action!],
        ],
      ),
    );
  }
}

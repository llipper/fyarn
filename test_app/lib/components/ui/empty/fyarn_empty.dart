import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnEmpty extends StatelessWidget {
  final String title;
  final String description;
  final Widget? icon;
  final Widget? action;

  const FyarnEmpty({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(fy.spacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[icon!, SizedBox(height: fy.spacing.md)],
            Text(
              title,
              style: fy.typography.h3.copyWith(color: fy.colors.foreground),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: fy.spacing.xs),
            Text(
              description,
              style: fy.typography.bodyMedium.copyWith(
                color: fy.colors.mutedForeground,
              ),
              textAlign: TextAlign.center,
            ),
            if (action != null) ...[SizedBox(height: fy.spacing.lg), action!],
          ],
        ),
      ),
    );
  }
}

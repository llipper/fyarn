import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnBreadcrumb extends StatelessWidget {
  final List<FyarnBreadcrumbItem> items;
  final Widget? separator;

  const FyarnBreadcrumb({super.key, required this.items, this.separator});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    final defaultSeparator = Icon(
      Icons.chevron_right,
      size: 16,
      color: fy.colors.mutedForeground,
    );

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(items.length * 2 - 1, (index) {
        if (index.isEven) {
          return items[index ~/ 2];
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: fy.spacing.xs),
            child: separator ?? defaultSeparator,
          );
        }
      }),
    );
  }
}

class FyarnBreadcrumbItem extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const FyarnBreadcrumbItem({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    final isLink = onTap != null;

    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: fy.typography.bodySmall.copyWith(
          color: isLink ? fy.colors.mutedForeground : fy.colors.foreground,
          fontWeight: isLink ? FontWeight.normal : FontWeight.w600,
          decoration: isLink ? TextDecoration.underline : null,
          decorationColor: fy.colors.mutedForeground.withValues(alpha: 0.4),
        ),
      ),
    );
  }
}

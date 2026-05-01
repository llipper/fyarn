import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';
import '../button/fyarn_button.dart';
import '../text/fyarn_text.dart';

class FyarnButtonGroupItem {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isSelected;

  FyarnButtonGroupItem({
    required this.label,
    this.onPressed,
    this.icon,
    this.isSelected = false,
  });
}

class FyarnButtonGroup extends StatelessWidget {
  final List<FyarnButtonGroupItem> items;
  final FyarnButtonSize size;

  const FyarnButtonGroup({
    super.key,
    required this.items,
    this.size = FyarnButtonSize.md,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fy.shapes.md),
        border: Border.all(color: fy.colors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isLast = index == items.length - 1;

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _GroupButton(
                  item: item,
                  size: size,
                  fy: fy,
                ),
                if (!isLast)
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: fy.colors.border,
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _GroupButton extends StatelessWidget {
  final FyarnButtonGroupItem item;
  final FyarnButtonSize size;
  final FyarnTokens fy;

  const _GroupButton({
    required this.item,
    required this.size,
    required this.fy,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.isSelected ? fy.colors.primary.withOpacity(0.1) : fy.colors.card,
      child: InkWell(
        onTap: item.onPressed,
        child: Padding(
          padding: _getPadding(size, fy),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (item.icon != null) ...[
                Icon(
                  item.icon,
                  size: size == FyarnButtonSize.sm ? 14 : 16,
                  color: item.isSelected ? fy.colors.primary : fy.colors.foreground,
                ),
                const SizedBox(width: 8),
              ],
              FyarnText(
                text: item.label,
                variant: FyarnTextVariant.labelMedium,
                color: item.isSelected ? fy.colors.primary : fy.colors.foreground,
                fontWeight: item.isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsets _getPadding(FyarnButtonSize size, FyarnTokens fy) {
    switch (size) {
      case FyarnButtonSize.sm:
        return EdgeInsets.symmetric(horizontal: fy.spacing.md, vertical: fy.spacing.xs);
      case FyarnButtonSize.lg:
        return EdgeInsets.symmetric(horizontal: fy.spacing.xl, vertical: fy.spacing.md);
      case FyarnButtonSize.md:
      default:
        return EdgeInsets.symmetric(horizontal: fy.spacing.lg, vertical: fy.spacing.sm);
    }
  }
}



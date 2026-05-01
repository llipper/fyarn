import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? label;

  const FyarnCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    Widget checkboxWidget = Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: fy.colors.primary,
      checkColor: fy.colors.onPrimary,
      side: BorderSide(color: fy.colors.border),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(fy.shapes.sm),
      ),
    );

    if (label != null) {
      return GestureDetector(
        onTap: () => onChanged?.call(!value),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkboxWidget,
            SizedBox(width: fy.spacing.xs),
            Text(label!, style: fy.typography.bodyMedium),
          ],
        ),
      );
    }

    return checkboxWidget;
  }
}




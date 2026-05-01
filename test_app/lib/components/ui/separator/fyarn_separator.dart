import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnSeparator extends StatelessWidget {
  final double thickness;
  final double? indent;
  final double? endIndent;
  final Axis orientation;
  final double? margin;

  const FyarnSeparator({
    super.key,
    this.thickness = 1,
    this.indent,
    this.endIndent,
    this.orientation = Axis.horizontal,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    final double spacing = margin ?? 0;

    if (orientation == Axis.horizontal) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: spacing),
        child: Divider(
          height: thickness,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
          color: fy.colors.border,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: VerticalDivider(
          width: thickness,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
          color: fy.colors.border,
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnInputGroup extends StatelessWidget {
  final Widget child;
  final Widget? prefix;
  final Widget? suffix;

  const FyarnInputGroup({
    super.key,
    required this.child,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fy.shapes.md),
        border: Border.all(color: fy.colors.border),
      ),
      child: Row(
        children: [
          if (prefix != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: fy.spacing.sm),
              decoration: BoxDecoration(
                color: fy.colors.muted,
                border: Border(right: BorderSide(color: fy.colors.border)),
              ),
              child: Center(child: prefix),
            ),
          Expanded(child: child),
          if (suffix != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: fy.spacing.sm),
              decoration: BoxDecoration(
                color: fy.colors.muted,
                border: Border(left: BorderSide(color: fy.colors.border)),
              ),
              child: Center(child: suffix),
            ),
        ],
      ),
    );
  }
}

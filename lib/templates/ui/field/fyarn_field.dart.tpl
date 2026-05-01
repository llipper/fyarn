import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnField extends StatelessWidget {
  final String label;
  final Widget child;
  final String? errorText;
  final String? description;

  const FyarnField({
    super.key,
    required this.label,
    required this.child,
    this.errorText,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: fy.typography.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
            color: fy.colors.foreground,
          ),
        ),
        SizedBox(height: fy.spacing.xs),
        child,
        if (description != null && errorText == null)
          Padding(
            padding: EdgeInsets.only(top: fy.spacing.xxs),
            child: Text(
              description!,
              style: fy.typography.bodySmall.copyWith(color: fy.colors.mutedForeground),
            ),
          ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: fy.spacing.xxs),
            child: Text(
              errorText!,
              style: fy.typography.bodySmall.copyWith(color: fy.colors.error),
            ),
          ),
      ],
    );
  }
}




import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnTextarea extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final int minLines;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  const FyarnTextarea({
    super.key,
    this.hint,
    this.controller,
    this.minLines = 3,
    this.maxLines = 5,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      style: fy.typography.bodyMedium,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: fy.typography.bodyMedium.copyWith(
          color: fy.colors.mutedForeground,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: fy.spacing.md,
          vertical: fy.spacing.sm,
        ),
        filled: true,
        fillColor: fy.colors.input,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(fy.shapes.md),
          borderSide: BorderSide(color: fy.colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(fy.shapes.md),
          borderSide: BorderSide(color: fy.colors.ring, width: 2),
        ),
      ),
    );
  }
}

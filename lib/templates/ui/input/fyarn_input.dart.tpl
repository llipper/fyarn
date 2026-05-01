import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

enum FyarnInputShape {
  defaultShape,
  rounded, // Estilo Pílula
}

class FyarnInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final FyarnInputShape shape;

  const FyarnInput({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.shape = FyarnInputShape.defaultShape,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    final radius = shape == FyarnInputShape.rounded 
        ? fy.shapes.borderRadiusFull
        : fy.shapes.borderRadiusMd;

    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: fy.typography.bodyMedium,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: fy.typography.bodyMedium.copyWith(color: fy.colors.mutedForeground),
        hintText: hint,
        hintStyle: fy.typography.bodyMedium.copyWith(color: fy.colors.mutedForeground),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          // Agora 100% tokens: xl (24) para rounded, md (16) para default
          horizontal: shape == FyarnInputShape.rounded ? fy.spacing.xl : fy.spacing.md, 
          vertical: fy.spacing.sm,
        ),
        filled: true,
        fillColor: fy.colors.input,
        enabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: fy.colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: fy.colors.ring, width: 2),
        ),
      ),
    );
  }
}



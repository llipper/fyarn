import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

enum FyarnTextVariant {
  h1,
  h2,
  h3,
  h4,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  button,
  caption,
  overline,
}

class FyarnText extends StatelessWidget {
  final String text;
  final FyarnTextVariant variant;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;

  const FyarnText({
    super.key,
    required this.text,
    this.variant = FyarnTextVariant.bodyMedium,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    TextStyle style;
    switch (variant) {
      case FyarnTextVariant.h1:
        style = fy.typography.h1;
        break;
      case FyarnTextVariant.h2:
        style = fy.typography.h2;
        break;
      case FyarnTextVariant.h3:
        style = fy.typography.h3;
        break;
      case FyarnTextVariant.h4:
        style = fy.typography.h4;
        break;
      case FyarnTextVariant.bodyLarge:
        style = fy.typography.bodyLarge;
        break;
      case FyarnTextVariant.bodyMedium:
        style = fy.typography.bodyMedium;
        break;
      case FyarnTextVariant.bodySmall:
        style = fy.typography.bodySmall;
        break;
      case FyarnTextVariant.labelLarge:
        style = fy.typography.labelLarge;
        break;
      case FyarnTextVariant.labelMedium:
        style = fy.typography.labelMedium;
        break;
      case FyarnTextVariant.labelSmall:
        style = fy.typography.labelSmall;
        break;
      case FyarnTextVariant.button:
        style = fy.typography.button;
        break;
      case FyarnTextVariant.caption:
        style = fy.typography.caption;
        break;
      case FyarnTextVariant.overline:
        style = fy.typography.overline;
        break;
    }

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style.copyWith(
        color: color,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

enum FyarnButtonVariant {
  primary,
  secondary,
  outline,
  ghost,
  destructive,
  link,
}

enum FyarnButtonSize { sm, md, lg, icon }

enum FyarnButtonShape { rounded, pill, square }

class FyarnButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final FyarnButtonVariant variant;
  final FyarnButtonSize size;
  final FyarnButtonShape shape;
  final bool isLoading;
  final double? width;

  const FyarnButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.variant = FyarnButtonVariant.primary,
    this.size = FyarnButtonSize.md,
    this.shape = FyarnButtonShape.rounded,
    this.isLoading = false,
    this.width,
  }) : assert(
         text != null || child != null,
         'Either text or child must be provided',
       );

  Color _getForegroundColor(FyarnColors colors) {
    switch (variant) {
      case FyarnButtonVariant.primary:
        return colors.onPrimary;
      case FyarnButtonVariant.secondary:
        return colors.onSecondary;
      case FyarnButtonVariant.outline:
        return colors.foreground;
      case FyarnButtonVariant.ghost:
        return colors.foreground;
      case FyarnButtonVariant.destructive:
        return colors.onError;
      case FyarnButtonVariant.link:
        return colors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    TextStyle textStyle;
    switch (size) {
      case FyarnButtonSize.sm:
        textStyle = fy.typography.bodySmall.copyWith(
          fontWeight: FontWeight.w600,
        );
        break;
      case FyarnButtonSize.md:
        textStyle = fy.typography.bodyMedium.copyWith(
          fontWeight: FontWeight.w600,
        );
        break;
      case FyarnButtonSize.lg:
        textStyle = fy.typography.bodyLarge.copyWith(
          fontWeight: FontWeight.bold,
        );
        break;
      case FyarnButtonSize.icon:
        textStyle = fy.typography.bodyMedium;
        break;
    }

    final foregroundColor = _getForegroundColor(fy.colors);
    Widget content =
        child ?? Text(text!, style: textStyle.copyWith(color: foregroundColor));

    if (isLoading) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size == FyarnButtonSize.sm ? 12 : 14,
            height: size == FyarnButtonSize.sm ? 12 : 14,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
            ),
          ),
          if (text != null || child != null)
            SizedBox(width: size == FyarnButtonSize.sm ? 6 : 10),
          Opacity(opacity: 0.7, child: content),
        ],
      );
    }

    Widget button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: _getButtonStyle(context, fy, foregroundColor),
      child: content,
    );

    if (width != null) {
      return SizedBox(width: width, child: button);
    }

    return button;
  }

  ButtonStyle _getButtonStyle(
    BuildContext context,
    FyarnTokens fy,
    Color foregroundColor,
  ) {
    final colors = fy.colors;
    final spacing = fy.spacing;
    final shapes = fy.shapes;

    Color? backgroundColor;
    BorderSide? border;

    switch (variant) {
      case FyarnButtonVariant.primary:
        backgroundColor = colors.primary;
        break;
      case FyarnButtonVariant.secondary:
        backgroundColor = colors.secondary;
        break;
      case FyarnButtonVariant.outline:
        backgroundColor = Colors.transparent;
        border = BorderSide(color: colors.border);
        break;
      case FyarnButtonVariant.ghost:
        backgroundColor = Colors.transparent;
        break;
      case FyarnButtonVariant.destructive:
        backgroundColor = colors.error;
        break;
      case FyarnButtonVariant.link:
        backgroundColor = Colors.transparent;
        break;
    }

    EdgeInsets padding;
    Size minSize;

    switch (size) {
      case FyarnButtonSize.sm:
        padding = EdgeInsets.symmetric(
          horizontal: spacing.sm,
          vertical: spacing.xxs,
        );
        minSize = const Size(64, 30);
        break;
      case FyarnButtonSize.md:
        padding = EdgeInsets.symmetric(
          horizontal: spacing.md,
          vertical: spacing.sm,
        );
        minSize = const Size(80, 40);
        break;
      case FyarnButtonSize.lg:
        padding = EdgeInsets.symmetric(
          horizontal: spacing.lg,
          vertical: spacing.md,
        );
        minSize = const Size(100, 48);
        break;
      case FyarnButtonSize.icon:
        padding = EdgeInsets.zero;
        minSize = const Size(40, 40);
        break;
    }

    double borderRadius;
    switch (shape) {
      case FyarnButtonShape.rounded:
        borderRadius = shapes.md;
        break;
      case FyarnButtonShape.pill:
        borderRadius = shapes.full;
        break;
      case FyarnButtonShape.square:
        borderRadius = 0;
        break;
    }

    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: 0,
      padding: padding,
      minimumSize: minSize,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: border ?? BorderSide.none,
      ),
    ).copyWith(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) return colors.hover;
        if (states.contains(WidgetState.pressed)) return colors.pressed;
        return backgroundColor;
      }),
    );
  }
}

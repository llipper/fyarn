import 'package:flutter/material.dart';
import 'package:test_app/components/core/theme/fyarn_colors.dart';
import 'package:test_app/components/core/theme/fyarn_spacing.dart';
import 'package:test_app/components/core/theme/fyarn_typography.dart';
import 'package:test_app/components/core/theme/fyarn_shapes.dart';

export 'package:test_app/components/core/theme/fyarn_colors.dart';
export 'package:test_app/components/core/theme/fyarn_spacing.dart';
export 'package:test_app/components/core/theme/fyarn_typography.dart';
export 'package:test_app/components/core/theme/fyarn_shapes.dart';

/// The Next-Gen Fyarn Design System Engine.
/// This class aggregates all atomic tokens into a single, injectable context.
/// Zero global state, 100% reactive, and multi-theme ready.
class FyarnTokens {
  final FyarnColors colors;
  final FyarnSpacing spacing;
  final FyarnTypography typography;
  final FyarnShapes shapes;

  const FyarnTokens({
    required this.colors,
    this.spacing = FyarnSpacing.standard,
    required this.typography,
    this.shapes = FyarnShapes.standard,
  });

  /// The entry point for components to access the design system.
  /// Replaces the old 'static' global access with context-aware resolution.
  static FyarnTokens of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<FyarnThemeScope>();
    if (scope == null) {
      throw Exception(
        'FyarnThemeScope not found in context. Ensure you wrapped your app with FyarnTheme.',
      );
    }
    return scope.tokens;
  }
}

/// The InheritedWidget that provides the Design System Engine to the widget tree.
class FyarnThemeScope extends InheritedWidget {
  final FyarnTokens tokens;

  const FyarnThemeScope({
    super.key,
    required this.tokens,
    required super.child,
  });

  @override
  bool updateShouldNotify(FyarnThemeScope oldWidget) {
    return tokens != oldWidget.tokens;
  }
}

/// Convenience extension for cleaner access in widgets: context.fy
extension FyarnContextExtensions on BuildContext {
  FyarnTokens get fy => FyarnTokens.of(this);
  FyarnColors get fyColors => fy.colors;
  FyarnSpacing get fySpacing => fy.spacing;
  FyarnTypography get fyTypography => fy.typography;
}

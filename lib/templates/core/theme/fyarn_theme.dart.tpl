import 'package:flutter/material.dart';
import 'fyarn_colors.dart';
import 'fyarn_spacing.dart';
import 'fyarn_typography.dart';
import 'fyarn_theme_engine.dart';
import '../tokens/tokens.dart';

class FyarnTheme extends StatelessWidget {
  final String themeName;
  final Brightness? brightness;
  final Widget child;

  const FyarnTheme({
    super.key,
    this.themeName = 'default',
    this.brightness,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBrightness = brightness ?? MediaQuery.platformBrightnessOf(context);
    final colors = FyarnThemeEngine.resolve(themeName, brightness: effectiveBrightness);
    
    final tokens = FyarnTokens(
      colors: colors,
      typography: FyarnTypography.standard(colors.foreground),
      spacing: FyarnSpacing.standard,
    );

    return FyarnThemeScope(
      tokens: tokens,
      child: Theme(
        data: _buildThemeData(colors, effectiveBrightness),
        child: child,
      ),
    );
  }

  static ThemeData _buildThemeData(FyarnColors colors, Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.foreground,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: colors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: colors.border),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colors.border,
        thickness: 1,
        space: 1,
      ),
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        error: colors.error,
        onError: colors.onError,
        surface: colors.surface,
        onSurface: colors.onSurface,
        outline: colors.border,
      ),
    );
  }
}

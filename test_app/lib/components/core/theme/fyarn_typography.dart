import 'package:flutter/material.dart';

/// Centralized typography system following Atomic Design principles
/// and premium design system standards.
class FyarnTypography {
  // Headings
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;

  // Body
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  // Labels
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  // Extras
  final TextStyle button;
  final TextStyle caption;
  final TextStyle overline;

  const FyarnTypography({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.button,
    required this.caption,
    required this.overline,
  });

  /// Standard premium typography with excellent readability.
  factory FyarnTypography.standard(Color color) {
    return FyarnTypography(
      h1: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
        height: 1.2,
        letterSpacing: -0.8,
      ),
      h2: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: color,
        height: 1.25,
        letterSpacing: -0.5,
      ),
      h3: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.3,
      ),
      h4: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.35,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.55,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.45,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
        height: 1.4,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color,
        height: 1.4,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: color,
        height: 1.4,
        letterSpacing: 0.3,
      ),
      button: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.4,
        letterSpacing: 0.2,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.4,
      ),
      overline: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: color,
        height: 1.6,
        letterSpacing: 1.0,
      ),
    );
  }

  /// Returns a new typography instance with a different color
  FyarnTypography withColor(Color newColor) {
    return copyWith(
      h1: h1.copyWith(color: newColor),
      h2: h2.copyWith(color: newColor),
      h3: h3.copyWith(color: newColor),
      h4: h4.copyWith(color: newColor),
      bodyLarge: bodyLarge.copyWith(color: newColor),
      bodyMedium: bodyMedium.copyWith(color: newColor),
      bodySmall: bodySmall.copyWith(color: newColor),
      labelLarge: labelLarge.copyWith(color: newColor),
      labelMedium: labelMedium.copyWith(color: newColor),
      labelSmall: labelSmall.copyWith(color: newColor),
      button: button.copyWith(color: newColor),
      caption: caption.copyWith(color: newColor),
      overline: overline.copyWith(color: newColor),
    );
  }

  /// Creates a copy with optional overrides
  FyarnTypography copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? button,
    TextStyle? caption,
    TextStyle? overline,
  }) {
    return FyarnTypography(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      button: button ?? this.button,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
    );
  }

  /// Merges this typography with another (useful for theme variations)
  FyarnTypography merge(FyarnTypography? other) {
    if (other == null) return this;
    return copyWith(
      h1: other.h1,
      h2: other.h2,
      h3: other.h3,
      h4: other.h4,
      bodyLarge: other.bodyLarge,
      bodyMedium: other.bodyMedium,
      bodySmall: other.bodySmall,
      labelLarge: other.labelLarge,
      labelMedium: other.labelMedium,
      labelSmall: other.labelSmall,
      button: other.button,
      caption: other.caption,
      overline: other.overline,
    );
  }
}

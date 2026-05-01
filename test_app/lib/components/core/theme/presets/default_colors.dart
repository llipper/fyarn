import 'package:flutter/material.dart';
import 'package:test_app/components/core/theme/fyarn_colors.dart';

class FyarnColorsDefault extends FyarnColors {
  @override
  Color get background => const Color(0xFFFFFFFF);
  @override
  Color get foreground => const Color(0xFF09090B);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get onSurface => const Color(0xFF09090B);
  @override
  Color get card => const Color(0xFFFFFFFF);
  @override
  Color get cardForeground => const Color(0xFF09090B);
  @override
  Color get popover => const Color(0xFFFFFFFF);
  @override
  Color get popoverForeground => const Color(0xFF09090B);

  @override
  Color get primary => const Color(0xFF18181B);
  @override
  Color get onPrimary => const Color(0xFFFAFAFA);
  @override
  Color get primaryContainer => const Color(0xFFF4F4F5);
  @override
  Color get onPrimaryContainer => const Color(0xFF18181B);

  @override
  Color get secondary => const Color(0xFFF1F5F9);
  @override
  Color get onSecondary => const Color(0xFF0F172A);
  @override
  Color get secondaryContainer => const Color(0xFFE2E8F0);
  @override
  Color get onSecondaryContainer => const Color(0xFF1E293B);

  @override
  Color get hover => const Color(0xFFF4F4F5);
  @override
  Color get pressed => const Color(0xFFE4E4E7);
  @override
  Color get focus => const Color(0xFF18181B);
  @override
  Color get disabled => const Color(0xFFF4F4F5);
  @override
  Color get ring => const Color(0xFF18181B);

  @override
  Color get muted => const Color(0xFFF1F5F9);
  @override
  Color get mutedForeground => const Color(0xFF64748B);
  @override
  Color get accent => const Color(0xFFF1F5F9);
  @override
  Color get accentForeground => const Color(0xFF0F172A);
  @override
  Color get border => const Color(0xFFE2E8F0);
  @override
  Color get input => const Color(0xFFF8FAFC);

  @override
  Color get success => const Color(0xFF10B981);
  @override
  Color get onSuccess => const Color(0xFFFFFFFF);
  @override
  Color get warning => const Color(0xFFF59E0B);
  @override
  Color get onWarning => const Color(0xFFFFFFFF);
  @override
  Color get error => const Color(0xFFEF4444);
  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  List<Color> get charts => const [
    Color(0xFF18181B),
    Color(0xFF3B82F6),
    Color(0xFF10B981),
    Color(0xFFE11D48),
    Color(0xFFF59E0B),
  ];
}

class FyarnColorsDefaultDark extends FyarnColors {
  @override
  Color get background => const Color(0xFF09090B);
  @override
  Color get foreground => const Color(0xFFFAFAFA);
  @override
  Color get surface => const Color(0xFF18181B);
  @override
  Color get onSurface => const Color(0xFFFAFAFA);
  @override
  Color get card => const Color(0xFF09090B);
  @override
  Color get cardForeground => const Color(0xFFFAFAFA);
  @override
  Color get popover => const Color(0xFF09090B);
  @override
  Color get popoverForeground => const Color(0xFFFAFAFA);

  @override
  Color get primary => const Color(0xFFFAFAFA);
  @override
  Color get onPrimary => const Color(0xFF18181B);
  @override
  Color get primaryContainer => const Color(0xFF27272A);
  @override
  Color get onPrimaryContainer => const Color(0xFFFAFAFA);

  @override
  Color get secondary => const Color(0xFF27272A);
  @override
  Color get onSecondary => const Color(0xFFFAFAFA);
  @override
  Color get secondaryContainer => const Color(0xFF3F3F46);
  @override
  Color get onSecondaryContainer => const Color(0xFFFAFAFA);

  @override
  Color get hover => const Color(0xFF27272A);
  @override
  Color get pressed => const Color(0xFF3F3F46);
  @override
  Color get focus => const Color(0xFFFAFAFA);
  @override
  Color get disabled => const Color(0xFF27272A);
  @override
  Color get ring => const Color(0xFFFAFAFA);

  @override
  Color get muted => const Color(0xFF27272A);
  @override
  Color get mutedForeground => const Color(0xFFA1A1AA);
  @override
  Color get accent => const Color(0xFF27272A);
  @override
  Color get accentForeground => const Color(0xFFFAFAFA);
  @override
  Color get border => const Color(0xFF27272A);
  @override
  Color get input => const Color(0xFF27272A);

  @override
  Color get success => const Color(0xFF10B981);
  @override
  Color get onSuccess => const Color(0xFFFFFFFF);
  @override
  Color get warning => const Color(0xFFF59E0B);
  @override
  Color get onWarning => const Color(0xFFFFFFFF);
  @override
  Color get error => const Color(0xFFEF4444);
  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  List<Color> get charts => const [
    Color(0xFFFAFAFA),
    Color(0xFF3B82F6),
    Color(0xFF10B981),
    Color(0xFFE11D48),
    Color(0xFFF59E0B),
  ];
}

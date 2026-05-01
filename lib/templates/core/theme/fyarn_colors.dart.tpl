import 'package:flutter/material.dart';

/// Production-grade semantic color system for Fyarn UI.
///
/// Inspirado em shadcn/ui + Material Design 3, com separação absoluta
/// entre Light e Dark modes. Nunca misture cores de temas diferentes.
abstract class FyarnColors {
  // --- Core Surfaces ---
  Color get background;
  Color get foreground;

  Color get surface;
  Color get onSurface;

  Color get card;
  Color get cardForeground;

  Color get popover;
  Color get popoverForeground;

  // --- Brand ---
  Color get primary;
  Color get onPrimary;
  Color get primaryContainer;
  Color get onPrimaryContainer;

  // --- Secondary ---
  Color get secondary;
  Color get onSecondary;
  Color get secondaryContainer;
  Color get onSecondaryContainer;

  // --- UI States (Static tokens) ---
  Color get hover;
  Color get pressed;
  Color get focus;
  Color get disabled;
  Color get ring;

  // --- Utility ---
  Color get muted;
  Color get mutedForeground;
  Color get accent;
  Color get accentForeground;
  Color get border;
  Color get input;

  // --- Semantic Feedback ---
  Color get success;
  Color get onSuccess;
  Color get warning;
  Color get onWarning;
  Color get error;
  Color get onError;

  // --- Chart Palette (para gráficos com boa distinção) ---
  List<Color> get charts;

  // ===========================================================================
  // ENGINE: State Resolver (muito útil para botões, cards, etc.)
  // ===========================================================================

  /// Resolve a cor correta baseado no estado do widget.
  Color resolveStateColor({
    required Color base,
    required Set<WidgetState> states,
    Color? hoverColor,
    Color? pressedColor,
    Color? disabledColor,
    Color? focusColor,
  }) {
    if (states.contains(WidgetState.disabled)) {
      return disabledColor ?? disabled;
    }
    if (states.contains(WidgetState.pressed)) {
      return pressedColor ?? pressed;
    }
    if (states.contains(WidgetState.hovered)) {
      return hoverColor ?? hover;
    }
    if (states.contains(WidgetState.focused)) {
      return focusColor ?? focus;
    }
    return base;
  }

  /// Converte facilmente para `WidgetStateProperty` (usado em Buttons, InkWell, etc.)
  WidgetStateProperty<Color> stateful(Color base) =>
      WidgetStateProperty.resolveWith(
        (states) => resolveStateColor(base: base, states: states),
      );

  /// Versão mais completa do stateful
  WidgetStateProperty<Color> statefulWith({
    required Color base,
    Color? hover,
    Color? pressed,
    Color? disabled,
    Color? focused,
  }) =>
      WidgetStateProperty.resolveWith(
        (states) => resolveStateColor(
          base: base,
          states: states,
          hoverColor: hover,
          pressedColor: pressed,
          disabledColor: disabled,
          focusColor: focused,
        ),
      );
}

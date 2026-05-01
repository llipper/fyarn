import 'package:flutter/material.dart';

/// Atomic Design Tokens for Spacing and Layout.
///
/// Garante consistência total em paddings, margins, gaps e espaçamentos
/// em todo o design system Fyarn.
class FyarnSpacing {
  // Base scale
  final double xxs;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double xxxl;

  // Conveniência para componentes específicos
  final double containerPadding;
  final double cardPadding;
  final double buttonPaddingHorizontal;
  final double buttonPaddingVertical;
  final double iconSize;

  const FyarnSpacing({
    this.xxs = 2.0,
    this.xs = 4.0,
    this.sm = 8.0,
    this.md = 16.0,
    this.lg = 24.0,
    this.xl = 32.0,
    this.xxl = 48.0,
    this.xxxl = 64.0,
    // Component-specific spacing
    this.containerPadding = 24.0,
    this.cardPadding = 20.0,
    this.buttonPaddingHorizontal = 16.0,
    this.buttonPaddingVertical = 12.0,
    this.iconSize = 20.0,
  });

  /// Escala padrão recomendada (4px base - muito usada em design systems modernos)
  static const FyarnSpacing standard = FyarnSpacing(
    xxs: 2.0,
    xs: 4.0,
    sm: 8.0,
    md: 16.0,
    lg: 24.0,
    xl: 32.0,
    xxl: 48.0,
    xxxl: 64.0,
    containerPadding: 24.0,
    cardPadding: 20.0,
    buttonPaddingHorizontal: 16.0,
    buttonPaddingVertical: 12.0,
    iconSize: 20.0,
  );

  // ====================== MÉTODOS DE CONVENIÊNCIA ======================

  /// Retorna o espaçamento baseado em um enum (mais seguro e legível)
  double get(FyarnSpace size) {
    return switch (size) {
      FyarnSpace.xxs => xxs,
      FyarnSpace.xs => xs,
      FyarnSpace.sm => sm,
      FyarnSpace.md => md,
      FyarnSpace.lg => lg,
      FyarnSpace.xl => xl,
      FyarnSpace.xxl => xxl,
      FyarnSpace.xxxl => xxxl,
    };
  }

  // EdgeInsets helpers (muito usados)
  EdgeInsets getEdgeInsets(FyarnSpace size) => EdgeInsets.all(get(size));
  EdgeInsets getEdgeInsetsSymmetric({
    FyarnSpace? horizontal,
    FyarnSpace? vertical,
  }) =>
      EdgeInsets.symmetric(
        horizontal: horizontal != null ? get(horizontal) : 0,
        vertical: vertical != null ? get(vertical) : 0,
      );

  EdgeInsets get cardPaddingAll => EdgeInsets.all(cardPadding);
  EdgeInsets get containerPaddingAll => EdgeInsets.all(containerPadding);
}

/// Enum para facilitar o uso em todo o código
enum FyarnSpace {
  xxs,
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
  xxxl,
}

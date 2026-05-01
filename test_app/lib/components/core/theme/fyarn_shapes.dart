import 'package:flutter/material.dart';

/// Definição centralizada de formas, bordas arredondadas e geometria para o Fyarn UI.
///
/// Inspirado nas melhores práticas de Design Systems (shadcn/ui + Material Design).
class FyarnShapes {
  // Border Radius (valores numéricos)
  final double none;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double full;

  // BorderRadius pré-computados (mais performático)
  final BorderRadius borderRadiusNone;
  final BorderRadius borderRadiusSm;
  final BorderRadius borderRadiusMd;
  final BorderRadius borderRadiusLg;
  final BorderRadius borderRadiusXl;
  final BorderRadius borderRadiusXxl;
  final BorderRadius borderRadiusFull;

  const FyarnShapes({
    required this.none,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.full,
    required this.borderRadiusNone,
    required this.borderRadiusSm,
    required this.borderRadiusMd,
    required this.borderRadiusLg,
    required this.borderRadiusXl,
    required this.borderRadiusXxl,
    required this.borderRadiusFull,
  });

  /// Configuração padrão (recomendada)
  static const FyarnShapes standard = FyarnShapes(
    none: 0,
    sm: 6,
    md: 12,
    lg: 16,
    xl: 20,
    xxl: 24,
    full: 9999,
    borderRadiusNone: BorderRadius.zero,
    borderRadiusSm: BorderRadius.all(Radius.circular(6)),
    borderRadiusMd: BorderRadius.all(Radius.circular(12)),
    borderRadiusLg: BorderRadius.all(Radius.circular(16)),
    borderRadiusXl: BorderRadius.all(Radius.circular(20)),
    borderRadiusXxl: BorderRadius.all(Radius.circular(24)),
    borderRadiusFull: BorderRadius.all(Radius.circular(9999)),
  );

  // ====================== MÉTODOS DE CONVENIÊNCIA ======================

  /// Retorna BorderRadius com base no tamanho desejado
  BorderRadius getBorderRadius(FyarnRadius size) {
    return switch (size) {
      FyarnRadius.none => borderRadiusNone,
      FyarnRadius.sm => borderRadiusSm,
      FyarnRadius.md => borderRadiusMd,
      FyarnRadius.lg => borderRadiusLg,
      FyarnRadius.xl => borderRadiusXl,
      FyarnRadius.xxl => borderRadiusXxl,
      FyarnRadius.full => borderRadiusFull,
    };
  }

  /// Cria um `RoundedRectangleBorder` (muito usado em Cards, Buttons, etc.)
  RoundedRectangleBorder roundedRectangle({
    FyarnRadius radius = FyarnRadius.md,
    BorderSide side = BorderSide.none,
  }) {
    return RoundedRectangleBorder(
      borderRadius: getBorderRadius(radius),
      side: side,
    );
  }

  /// Cria um `StadiumBorder` (pill shape)
  StadiumBorder stadium({BorderSide side = BorderSide.none}) {
    return StadiumBorder(side: side);
  }
}

/// Enum para facilitar o uso em componentes
enum FyarnRadius { none, sm, md, lg, xl, xxl, full }

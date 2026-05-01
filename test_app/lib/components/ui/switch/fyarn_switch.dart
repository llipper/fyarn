import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const FyarnSwitch({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: fy.colors.primary,
      activeTrackColor: fy.colors.primary.withValues(alpha: 0.5),
      inactiveThumbColor: fy.colors.mutedForeground,
      inactiveTrackColor: fy.colors.muted,
    );
  }
}

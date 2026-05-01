import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;

  const FyarnSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: fy.colors.primary,
        inactiveTrackColor: fy.colors.secondary,
        thumbColor: fy.colors.primary,
        overlayColor: fy.colors.primary.withValues(alpha: 0.1),
        trackHeight: 4,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
      ),
      child: Slider(
        value: value,
        onChanged: onChanged,
        min: min,
        max: max,
      ),
    );
  }
}




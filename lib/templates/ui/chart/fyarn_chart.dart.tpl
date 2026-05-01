import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnBarChart extends StatelessWidget {
  final List<double> data;
  final List<String> labels;
  final double height;

  const FyarnBarChart({
    super.key,
    required this.data,
    required this.labels,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    final maxVal = data.isEmpty ? 1.0 : data.reduce((a, b) => a > b ? a : b);
    
    return SizedBox(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(data.length, (index) {
          final ratio = data[index] / maxVal;
          final color = fy.colors.charts[index % fy.colors.charts.length];
          
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: fy.spacing.xxs),
                  height: (height - 40) * ratio,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(fy.shapes.sm)),
                  ),
                ),
                SizedBox(height: fy.spacing.xs),
                Text(
                  labels[index],
                  style: fy.typography.labelMedium.copyWith(color: fy.colors.mutedForeground),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}




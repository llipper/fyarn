import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class ConsumptionChart extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<ConsumptionData> data;

  const ConsumptionChart({
    super.key,
    this.title = 'Consumption',
    this.subtitle = 'Last week',
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Container(
      padding: EdgeInsets.all(fy.spacing.xl),
      decoration: BoxDecoration(
        color: fy.colors.card, 
        borderRadius: BorderRadius.circular(fy.shapes.lg * 2.5),
        border: Border.all(color: fy.colors.border, width: 1), 
        boxShadow: [
          BoxShadow(
            color: fy.colors.foreground.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: fy.typography.h3.copyWith(
                  color: fy.colors.foreground, 
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: fy.colors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    subtitle,
                    style: fy.typography.bodySmall.copyWith(
                      color: fy.colors.mutedForeground,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 48),
          SizedBox(
            height: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: data.map((d) => _ChartBar(data: d)).toList(),
            ),
          ),
          const SizedBox(height: 24),
          Divider(color: fy.colors.border, height: 1),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: data.map((d) => SizedBox(
              width: 32,
              child: Center(
                child: Text(
                  d.label,
                  style: fy.typography.bodySmall.copyWith(
                    color: fy.colors.mutedForeground,
                    fontSize: 14,
                  ),
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class ConsumptionData {
  final String label;
  final double value; 
  final double maxValue; 

  const ConsumptionData({
    required this.label,
    required this.value,
    this.maxValue = 0.8,
  });
}

class _ChartBar extends StatelessWidget {
  final ConsumptionData data;

  const _ChartBar({required this.data});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 20,
              height: 150 * data.maxValue,
              decoration: BoxDecoration(
                color: fy.colors.muted,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: data.value),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOutQuart,
              builder: (context, val, _) {
                return Container(
                  width: 20,
                  height: 150 * val,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        fy.colors.primary,
                        fy.colors.primary.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: fy.colors.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}



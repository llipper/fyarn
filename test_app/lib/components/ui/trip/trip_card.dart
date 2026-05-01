import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/text/fyarn_text.dart';

class FyarnTripCard extends StatelessWidget {
  final String destination;
  final String distance;
  final String duration;
  final String price;

  const FyarnTripCard({
    super.key,
    this.destination = 'Pico das Agulhas Negras',
    this.distance = '4.2 km',
    this.duration = '12 min',
    this.price = 'R\$ 24,90',
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return ClipRRect(
      borderRadius: fy.shapes.borderRadiusXl,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: EdgeInsets.all(fy.spacing.xl),
          decoration: BoxDecoration(
            color: fy.colors.card.withOpacity(0.8),
            borderRadius: fy.shapes.borderRadiusXl,
            border: Border.all(color: fy.colors.border.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FyarnText(
                          text: destination,
                          variant: FyarnTextVariant.h3,
                          fontWeight: FontWeight.bold,
                        ),
                        FyarnText(
                          text: 'Seu próximo destino',
                          variant: FyarnTextVariant.labelSmall,
                          color: fy.colors.mutedForeground,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: fy.colors.primary,
                      borderRadius: fy.shapes.borderRadiusFull,
                    ),
                    child: FyarnText(
                      text: price,
                      variant: FyarnTextVariant.labelMedium,
                      color: fy.colors.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: fy.spacing.xl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _TripInfoItem(
                    icon: Icons.straighten_rounded,
                    label: 'Distância',
                    value: distance,
                  ),
                  _TripInfoItem(
                    icon: Icons.timer_outlined,
                    label: 'Tempo',
                    value: duration,
                  ),
                  _TripInfoItem(
                    icon: Icons.terrain_rounded,
                    label: 'Esforço',
                    value: 'Moderado',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TripInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _TripInfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    return Column(
      children: [
        Icon(icon, color: fy.colors.primary, size: 20),
        const SizedBox(height: 8),
        FyarnText(
          text: value,
          variant: FyarnTextVariant.bodyMedium,
          fontWeight: FontWeight.bold,
        ),
        FyarnText(
          text: label,
          variant: FyarnTextVariant.labelSmall,
          color: fy.colors.mutedForeground,
        ),
      ],
    );
  }
}

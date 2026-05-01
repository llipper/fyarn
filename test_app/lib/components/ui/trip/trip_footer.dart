import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/text/fyarn_text.dart';

class FyarnTripFooter extends StatelessWidget {
  final String driverName;
  final String vehicleInfo;
  final String status;
  final String timeRemaining;
  final String? driverImage;

  const FyarnTripFooter({
    super.key,
    this.driverName = 'Marcos Oliveira',
    this.vehicleInfo = 'Toyota Corolla • ABC-1234',
    this.status = 'A caminho',
    this.timeRemaining = '4 min',
    this.driverImage,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fy.spacing.lg,
          vertical: fy.spacing.md,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: fy.colors.card.withOpacity(0.9),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Avatar Minimalista
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: fy.colors.primary.withOpacity(0.1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: driverImage != null
                          ? Image.network(driverImage!, fit: BoxFit.cover)
                          : Icon(
                              Icons.person_rounded,
                              color: fy.colors.primary,
                            ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Info Central
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FyarnText(
                          text: driverName,
                          variant: FyarnTextVariant.bodyMedium,
                          fontWeight: FontWeight.w900,
                        ),
                        FyarnText(
                          text: vehicleInfo,
                          variant: FyarnTextVariant.bodySmall,
                          color: fy.colors.mutedForeground.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                  // Status Dinâmico
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: fy.colors.primary,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: fy.colors.primary.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.bolt_rounded,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 6),
                        FyarnText(
                          text: timeRemaining,
                          variant: FyarnTextVariant.bodySmall,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

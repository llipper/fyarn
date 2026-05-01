import 'package:flutter/material.dart';
import 'dart:ui';
import '../../core/tokens/tokens.dart';
import '../../ui/text/fyarn_text.dart';

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
          horizontal: fy.spacing.xl,
          vertical: fy.spacing.lg,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(fy.shapes.full),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: fy.colors.card.withOpacity(0.9),
                borderRadius: BorderRadius.circular(fy.shapes.full),
                border: Border.all(color: fy.colors.border.withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: fy.colors.primary.withOpacity(0.1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(fy.shapes.full),
                      child: driverImage != null
                          ? Image.network(driverImage!, fit: BoxFit.cover)
                          : Icon(
                              Icons.person_rounded,
                              color: fy.colors.primary,
                            ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FyarnText(
                          text: driverName,
                          variant: FyarnTextVariant.bodyMedium,
                          fontWeight: FontWeight.bold,
                        ),
                        FyarnText(
                          text: vehicleInfo,
                          variant: FyarnTextVariant.labelSmall,
                          color: fy.colors.mutedForeground,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: fy.colors.primary,
                      borderRadius: BorderRadius.circular(fy.shapes.full),
                      boxShadow: [
                        BoxShadow(
                          color: fy.colors.primary.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.bolt_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        FyarnText(
                          text: timeRemaining,
                          variant: FyarnTextVariant.labelMedium,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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



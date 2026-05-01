import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnAvatar extends StatelessWidget {
  final String? imageUrl;
  final String fallback;
  final double size;

  const FyarnAvatar({
    super.key,
    this.imageUrl,
    required this.fallback,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: fy.colors.muted,
        shape: BoxShape.circle,
        border: Border.all(color: fy.colors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: imageUrl != null
          ? Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _buildFallback(fy),
            )
          : _buildFallback(fy),
    );
  }

  Widget _buildFallback(FyarnTokens fy) {
    return Center(
      child: Text(
        fallback.substring(0, 1).toUpperCase(),
        style: fy.typography.bodyMedium.copyWith(
          fontWeight: FontWeight.bold,
          color: fy.colors.mutedForeground,
        ),
      ),
    );
  }
}

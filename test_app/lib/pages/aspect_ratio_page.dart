import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/aspect_ratio/fyarn_aspect_ratio.dart';
import 'package:test_app/components/ui/shared_app_bar.dart';

class AspectRatioPage extends StatelessWidget {
  const AspectRatioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Aspect Ratio Showcase'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle(title: '16:9 — Widescreen', fy: fy),
              const SizedBox(height: 16),
              FyarnAspectRatio(
                ratio: 16 / 9,
                child: _PlaceholderBox(fy: fy, label: 'Video Player (16:9)'),
              ),
              
              const SizedBox(height: 40),
              _SectionTitle(title: '4:3 — Standard', fy: fy),
              const SizedBox(height: 16),
              FyarnAspectRatio(
                ratio: 4 / 3,
                child: _PlaceholderBox(fy: fy, label: 'Classic View (4:3)'),
              ),
              
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SectionTitle(title: '1:1 — Square', fy: fy),
                        const SizedBox(height: 16),
                        FyarnAspectRatio(
                          ratio: 1.0,
                          child: _PlaceholderBox(fy: fy, label: 'Profile'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SectionTitle(title: '9:16 — Story', fy: fy),
                        const SizedBox(height: 16),
                        FyarnAspectRatio(
                          ratio: 9 / 16,
                          child: _PlaceholderBox(fy: fy, label: 'Reels / Stories'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              _SectionTitle(title: '21:9 — Ultrawide', fy: fy),
              const SizedBox(height: 16),
              FyarnAspectRatio(
                ratio: 21 / 9,
                child: _PlaceholderBox(fy: fy, label: 'Cinematic Monitor (21:9)'),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaceholderBox extends StatelessWidget {
  final FyarnTokens fy;
  final String label;
  const _PlaceholderBox({required this.fy, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [fy.colors.primary, fy.colors.primary.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: fy.shapes.borderRadiusMd,
        boxShadow: [
          BoxShadow(
            color: fy.colors.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.aspect_ratio_rounded, color: fy.colors.onPrimary.withOpacity(0.8)),
            const SizedBox(height: 8),
            Text(
              label,
              style: fy.typography.bodySmall.copyWith(
                color: fy.colors.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final FyarnTokens fy;
  const _SectionTitle({required this.title, required this.fy});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: fy.typography.h3.copyWith(color: fy.colors.foreground)),
        const SizedBox(height: 4),
        Container(
          width: 40,
          height: 3,
          decoration: BoxDecoration(
            color: fy.colors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

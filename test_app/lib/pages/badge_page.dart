import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/text/fyarn_text.dart';
import '../components/ui/badge/fyarn_badge.dart';
import '../components/ui/shared_app_bar.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Badges'),
      body: ListView(
        padding: EdgeInsets.all(fy.spacing.xl),
        children: [
          const FyarnText(
            text: 'Semantic Badges',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          FyarnText(
            text: 'Small status indicators with theme-aware colors.',
            variant: FyarnTextVariant.bodyMedium,
            color: fy.colors.mutedForeground,
          ),
          SizedBox(height: fy.spacing.xl),
          
          Wrap(
            spacing: fy.spacing.sm,
            runSpacing: fy.spacing.sm,
            children: [
              const FyarnBadge(text: 'Primary', variant: FyarnBadgeVariant.primary),
              const FyarnBadge(text: 'Secondary', variant: FyarnBadgeVariant.secondary),
              const FyarnBadge(text: 'Outline', variant: FyarnBadgeVariant.outline),
              const FyarnBadge(text: 'Destructive', variant: FyarnBadgeVariant.destructive),
            ],
          ),
          
          SizedBox(height: fy.spacing.xxl),
          const Divider(),
          SizedBox(height: fy.spacing.xxl),
          
          const FyarnText(
            text: 'Practical Examples',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: fy.spacing.xl),
          
          _BadgeRow(
            label: 'Order Status',
            badge: const FyarnBadge(text: 'Delivered', variant: FyarnBadgeVariant.primary),
          ),
          _BadgeRow(
            label: 'System Alert',
            badge: const FyarnBadge(text: 'Critical', variant: FyarnBadgeVariant.destructive),
          ),
          _BadgeRow(
            label: 'Beta Feature',
            badge: const FyarnBadge(text: 'Experimental', variant: FyarnBadgeVariant.secondary),
          ),
        ],
      ),
    );
  }
}

class _BadgeRow extends StatelessWidget {
  final String label;
  final Widget badge;

  const _BadgeRow({required this.label, required this.badge});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    return Padding(
      padding: EdgeInsets.only(bottom: fy.spacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FyarnText(text: label, variant: FyarnTextVariant.bodyMedium),
          badge,
        ],
      ),
    );
  }
}

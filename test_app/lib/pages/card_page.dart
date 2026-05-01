import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/card/fyarn_card.dart';
import '../components/ui/button/fyarn_button.dart';
import '../components/ui/text/fyarn_text.dart';
import '../components/ui/memory/memory_card.dart';
import '../components/ui/shared_app_bar.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Card Components'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(fy.spacing.xl),
        child: Column(
          children: [
            // Standard Card
            FyarnCard(
              title: const FyarnText(text: 'Standard Card', variant: FyarnTextVariant.h4),
              subtitle: const FyarnText(
                text: 'This is a standard card with title and subtitle.',
                variant: FyarnTextVariant.bodySmall,
              ),
              content: Padding(
                padding: EdgeInsets.symmetric(vertical: fy.spacing.md),
                child: const FyarnText(
                  text: 'Cards are used to group related information together. They can contain text, images, buttons, and more.',
                  variant: FyarnTextVariant.bodyMedium,
                ),
              ),
              actions: [
                FyarnButton(
                  text: 'Action',
                  onPressed: () {},
                  size: FyarnButtonSize.sm,
                ),
                const SizedBox(width: 8),
                FyarnButton(
                  text: 'Cancel',
                  onPressed: () {},
                  size: FyarnButtonSize.sm,
                  variant: FyarnButtonVariant.outline,
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Memory Style
            const FyarnText(
              text: 'Memory Style',
              variant: FyarnTextVariant.h4,
            ),
            const SizedBox(height: 16),
            const FyarnMemoryCard(),
            const SizedBox(height: 16),
            const FyarnMemoryCard(
              title: 'Swiss Alps',
              subtitle: 'Winter 2024',
              tag: 'Adventure',
              imageUrl: 'https://images.unsplash.com/photo-1491555103944-7c647fd857e6?auto=format&fit=crop&q=80&w=1000',
            ),
            const SizedBox(height: 32),
            
            // Clean Card (No Title/Actions)
            FyarnCard(
              content: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(Icons.auto_awesome_rounded, color: fy.colors.primary, size: 40),
                    const SizedBox(height: 16),
                    const FyarnText(
                      text: 'Minimal Content Card',
                      variant: FyarnTextVariant.h4,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    FyarnText(
                      text: 'A clean card used just as a container for custom UI elements.',
                      variant: FyarnTextVariant.bodySmall,
                      textAlign: TextAlign.center,
                      color: fy.colors.mutedForeground,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Stats Card
            FyarnCard(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat(fy, '2.4k', 'Views'),
                  _buildStat(fy, '158', 'Sales'),
                  _buildStat(fy, '48', 'Events'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(FyarnTokens fy, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: fy.typography.h3.copyWith(color: fy.colors.foreground, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: fy.typography.bodySmall.copyWith(color: fy.colors.mutedForeground),
        ),
      ],
    );
  }
}

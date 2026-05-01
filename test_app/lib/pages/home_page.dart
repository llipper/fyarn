import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/text/fyarn_text.dart';
import '../components/ui/shared_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Fyarn UI Components'),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(fy.spacing.xl),
          children: [
            const FyarnText(
              text: 'Design System Explorer',
              variant: FyarnTextVariant.h2,
              fontWeight: FontWeight.bold,
            ),
            FyarnText(
              text: 'Experience high-fidelity, premium UI components.',
              variant: FyarnTextVariant.bodyMedium,
              color: fy.colors.mutedForeground,
            ),
            SizedBox(height: fy.spacing.xxl),
            
            _ComponentCard(
              title: 'Trail Tracking',
              description: 'High-end trail cards with immersive image headers.',
              icon: Icons.map_outlined,
              color: Colors.greenAccent,
              onTap: () => Navigator.pushNamed(context, '/trail'),
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Trip Management',
              description: 'Floating glassmorphic overlays and status footers.',
              icon: Icons.directions_car_outlined,
              color: Colors.blue,
              onTap: () => Navigator.pushNamed(context, '/trip'),
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Authentication',
              description: 'Minimal, Card, and Split auth experiences.',
              icon: Icons.lock_outline_rounded,
              color: Colors.purple,
              onTap: () => Navigator.pushNamed(context, '/auth'),
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Carousel Slider',
              description: 'Animated featured content with glassmorphism.',
              icon: Icons.view_carousel_outlined,
              color: Colors.orange,
              onTap: () => Navigator.pushNamed(context, '/carousel'),
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Calendar Picker',
              description: 'Theme-aware date selection experience.',
              icon: Icons.calendar_today_rounded,
              color: Colors.red,
              onTap: () => Navigator.pushNamed(context, '/calendar'),
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Badges & Status',
              description: 'Semantic status indicators with variants.',
              icon: Icons.label_outline_rounded,
              color: Colors.indigo,
              onTap: () => Navigator.pushNamed(context, '/badges'),
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Breadcrumb Nav',
              description: 'Hierarchical navigation paths.',
              icon: Icons.linear_scale_rounded,
              color: Colors.teal,
              onTap: () => Navigator.pushNamed(context, '/breadcrumb'),
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Button Groups',
              description: 'Related actions with state management.',
              icon: Icons.view_column_outlined,
              color: Colors.amber,
              onTap: () => Navigator.pushNamed(context, '/button_group'),
            ),
            
            SizedBox(height: fy.spacing.xxl),
            const Divider(),
            SizedBox(height: fy.spacing.xxl),
            
            const FyarnText(
              text: 'Foundations & Atoms',
              variant: FyarnTextVariant.h3,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Typography',
              description: 'Semantic text variants from H1 to Overline.',
              icon: Icons.text_fields_outlined,
              color: fy.colors.mutedForeground,
              onTap: () => Navigator.pushNamed(context, '/text'),
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Premium Accordion',
              description: 'Animated expansion panels with multiple variants.',
              icon: Icons.layers_outlined,
              color: fy.colors.mutedForeground,
              onTap: () => Navigator.pushNamed(context, '/accordion'),
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Memory Cards',
              description: 'Compact grid-aware cards for stats.',
              icon: Icons.auto_awesome_motion_outlined,
              color: fy.colors.mutedForeground,
              onTap: () => Navigator.pushNamed(context, '/memory'),
            ),
            
            SizedBox(height: fy.spacing.xxl),
            const Divider(),
            SizedBox(height: fy.spacing.xxl),
            
            const FyarnText(
              text: 'Overlays & Feedback',
              variant: FyarnTextVariant.h3,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Alerts',
              description: 'High-visibility feedback for critical states.',
              icon: Icons.warning_amber_rounded,
              color: fy.colors.error,
              onTap: () => Navigator.pushNamed(context, '/alerts'),
            ),
            SizedBox(height: fy.spacing.md),
            _ComponentCard(
              title: 'Dialogs',
              description: 'Professional modal system for confirmations.',
              icon: Icons.chat_bubble_outline_rounded,
              color: fy.colors.primary,
              onTap: () => Navigator.pushNamed(context, '/dialogs'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ComponentCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ComponentCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return InkWell(
      onTap: onTap,
      borderRadius: fy.shapes.borderRadiusMd,
      child: Container(
        padding: EdgeInsets.all(fy.spacing.lg),
        decoration: BoxDecoration(
          color: fy.colors.card,
          border: Border.all(color: fy.colors.border),
          borderRadius: fy.shapes.borderRadiusMd,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(fy.spacing.sm),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: fy.shapes.borderRadiusSm,
              ),
              child: Icon(icon, color: color),
            ),
            SizedBox(width: fy.spacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FyarnText(
                    text: title,
                    variant: FyarnTextVariant.bodyLarge,
                    fontWeight: FontWeight.bold,
                  ),
                  FyarnText(
                    text: description,
                    variant: FyarnTextVariant.bodySmall,
                    color: fy.colors.mutedForeground,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: fy.colors.mutedForeground.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}

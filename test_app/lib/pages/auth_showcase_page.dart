import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/auth/login_card.dart';
import 'package:test_app/components/ui/auth/login_immersive.dart';
import 'package:test_app/components/ui/auth/login_minimal.dart';
import 'package:test_app/components/ui/auth/login_split.dart';
import 'package:test_app/components/ui/auth/signup_card.dart';
import 'package:test_app/components/ui/auth/signup_immersive.dart';
import 'package:test_app/components/ui/auth/signup_minimal.dart';
import 'package:test_app/components/ui/auth/signup_split.dart';

import 'package:test_app/components/ui/shared_app_bar.dart';

class AuthShowcasePage extends StatelessWidget {
  const AuthShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Authentication Showcase'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle(title: 'Login Variants', fy: fy),
              const SizedBox(height: 16),
              _AuthCard(
                fy: fy,
                title: 'Minimal',
                description: 'Clean, focused login without borders or cards.',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FyarnLoginMinimalPage()),
                ),
              ),
              const SizedBox(height: 12),
              _AuthCard(
                fy: fy,
                title: 'Card',
                description: 'Classic centered card layout for balanced focus.',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FyarnLoginCardPage()),
                ),
              ),
              const SizedBox(height: 12),
              _AuthCard(
                fy: fy,
                title: 'Split',
                description: 'Modern desktop layout with responsive fallback.',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FyarnLoginSplitPage()),
                ),
              ),
              const SizedBox(height: 12),
              _AuthCard(
                fy: fy,
                title: 'Immersive',
                description: 'Full-screen visual experience with image header.',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FyarnLoginImmersivePage()),
                ),
              ),
              const SizedBox(height: 40),
              _SectionTitle(title: 'Signup Variants', fy: fy),
              const SizedBox(height: 16),
              _AuthCard(
                fy: fy,
                title: 'Minimal',
                description: 'Simple signup flow with essential fields.',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FyarnSignupMinimalPage()),
                ),
              ),
              const SizedBox(height: 12),
              _AuthCard(
                fy: fy,
                title: 'Card',
                description: 'Enclosed signup form within a semantic card.',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FyarnSignupCardPage()),
                ),
              ),
              const SizedBox(height: 12),
              _AuthCard(
                fy: fy,
                title: 'Split',
                description: 'Immersive signup with responsive Column layout.',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FyarnSignupSplitPage()),
                ),
              ),
              const SizedBox(height: 12),
              _AuthCard(
                fy: fy,
                title: 'Immersive',
                description: 'Stunning full-screen registration experience.',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FyarnSignupImmersivePage()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthCard extends StatelessWidget {
  final FyarnTokens fy;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _AuthCard({
    required this.fy,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: fy.shapes.borderRadiusMd,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: fy.colors.card,
          border: Border.all(color: fy.colors.border),
          borderRadius: fy.shapes.borderRadiusMd,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: fy.typography.h4.copyWith(color: fy.colors.foreground)),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: fy.typography.bodySmall.copyWith(color: fy.colors.mutedForeground),
                  ),
                ],
              ),
            ),
            Icon(Icons.open_in_new_rounded, size: 20, color: fy.colors.primary),
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

import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/alert/fyarn_alert.dart';
import 'package:test_app/components/ui/shared_app_bar.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Alert'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle(title: 'Info Alert', fy: fy),
              const SizedBox(height: 16),
              const FyarnAlert(
                title: 'Heads up!',
                description: 'You can add components to your app using the cli.',
                icon: Icons.info_outline_rounded,
              ),
              const SizedBox(height: 32),
              _SectionTitle(title: 'Success Alert', fy: fy),
              const SizedBox(height: 16),
              FyarnAlert(
                title: 'Success!',
                description: 'Your project has been created successfully.',
                icon: Icons.check_circle_outline_rounded,
                variant: FyarnAlertVariant.success,
              ),
              const SizedBox(height: 32),
              _SectionTitle(title: 'Warning Alert', fy: fy),
              const SizedBox(height: 16),
              FyarnAlert(
                title: 'Warning',
                description: 'Please review your data before submitting.',
                icon: Icons.warning_amber_rounded,
                variant: FyarnAlertVariant.warning,
              ),
              const SizedBox(height: 32),
              _SectionTitle(title: 'Destructive Alert', fy: fy),
              const SizedBox(height: 16),
              FyarnAlert(
                title: 'Error',
                description: 'Your session has expired. Please log in again.',
                icon: Icons.error_outline_rounded,
                variant: FyarnAlertVariant.destructive,
              ),
            ],
          ),
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

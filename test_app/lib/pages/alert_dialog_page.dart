import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/alert_dialog/fyarn_alert_dialog.dart';
import 'package:test_app/components/ui/button/fyarn_button.dart';
import 'package:test_app/components/ui/shared_app_bar.dart';

class AlertDialogPage extends StatelessWidget {
  const AlertDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Alert Dialog'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle(title: 'Standard Dialog', fy: fy),
              const SizedBox(height: 16),
              FyarnButton(
                text: 'Show Dialog',
                onPressed: () => _showDialog(context),
              ),
              const SizedBox(height: 40),
              _SectionTitle(title: 'Destructive Dialog', fy: fy),
              const SizedBox(height: 16),
              FyarnButton(
                text: 'Show Destructive Dialog',
                variant: FyarnButtonVariant.destructive,
                onPressed: () => _showDestructiveDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => FyarnAlertDialog(
        title: 'Are you absolutely sure?',
        description: 'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
        cancelLabel: 'Cancel',
        actionLabel: 'Continue',
        onAction: () => Navigator.pop(context),
      ),
    );
  }

  void _showDestructiveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => FyarnAlertDialog(
        title: 'Delete Project?',
        description: 'Are you sure you want to delete this project? All associated data will be lost forever.',
        cancelLabel: 'Keep Project',
        actionLabel: 'Delete',
        isDestructive: true,
        onAction: () => Navigator.pop(context),
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

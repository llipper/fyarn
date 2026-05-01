import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/input/fyarn_input.dart';
import '../components/ui/shared_app_bar.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Input Components'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(fy.spacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              fy,
              'Standard Inputs',
              'Default rectangular style with various configurations.',
              [
                const FyarnInput(
                  label: 'Basic Input',
                  hint: 'Type something...',
                ),
                const SizedBox(height: 24),
                const FyarnInput(
                  label: 'With Prefix Icon',
                  hint: 'Search...',
                  prefixIcon: Icon(Icons.search_rounded, size: 20),
                ),
                const SizedBox(height: 24),
                const FyarnInput(
                  label: 'Password Field',
                  hint: '••••••••',
                  obscureText: true,
                  prefixIcon: Icon(Icons.lock_outline_rounded, size: 20),
                  suffixIcon: Icon(Icons.visibility_off_outlined, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 48),
            _buildSection(
              fy,
              'Rounded (Pill) Inputs',
              'Modern pill-shaped inputs using radiusFull token.',
              [
                const FyarnInput(
                  label: 'Rounded Input',
                  hint: 'Modern style...',
                  shape: FyarnInputShape.rounded,
                ),
                const SizedBox(height: 24),
                const FyarnInput(
                  label: 'Rounded with Icon',
                  hint: 'Email address',
                  prefixIcon: Icon(Icons.email_outlined, size: 20),
                  shape: FyarnInputShape.rounded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(FyarnTokens fy, String title, String description, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: fy.typography.h3.copyWith(color: fy.colors.foreground)),
        const SizedBox(height: 4),
        Text(description, style: fy.typography.bodySmall.copyWith(color: fy.colors.mutedForeground)),
        const SizedBox(height: 24),
        ...children,
      ],
    );
  }
}

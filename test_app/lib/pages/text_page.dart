import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/text/fyarn_text.dart';
import '../components/ui/shared_app_bar.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Typography System'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(fy.spacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              fy,
              'Headings',
              'Used for titles and section breaks.',
              [
                const FyarnText(text: 'Heading 1 (Hero)', variant: FyarnTextVariant.h1),
                const SizedBox(height: 16),
                const FyarnText(text: 'Heading 2 (Section)', variant: FyarnTextVariant.h2),
                const SizedBox(height: 16),
                const FyarnText(text: 'Heading 3 (Sub-section)', variant: FyarnTextVariant.h3),
                const SizedBox(height: 16),
                const FyarnText(text: 'Heading 4 (Title)', variant: FyarnTextVariant.h4),
              ],
            ),
            const SizedBox(height: 48),
            _buildSection(
              fy,
              'Body & UI Text',
              'Standard text for content and interface elements.',
              [
                const FyarnText(
                  text: 'Body Large: Use this for prominent paragraphs that need extra readability.',
                  variant: FyarnTextVariant.bodyLarge,
                ),
                const SizedBox(height: 16),
                const FyarnText(
                  text: 'Body Medium: The default text style for most of the application content.',
                  variant: FyarnTextVariant.bodyMedium,
                ),
                const SizedBox(height: 16),
                const FyarnText(
                  text: 'Body Small: Perfect for secondary information, captions, or legal text.',
                  variant: FyarnTextVariant.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 48),
            _buildSection(
              fy,
              'Semantic Colors',
              'Text that automatically adapts to theme roles.',
              [
                FyarnText(
                  text: 'Primary Colored Text',
                  variant: FyarnTextVariant.bodyMedium,
                  color: fy.colors.primary,
                ),
                const SizedBox(height: 12),
                const FyarnText(
                  text: 'Muted Foreground Text (Subtle)',
                  variant: FyarnTextVariant.bodyMedium,
                  color: Colors.grey, // Exemplo, idealmente usar fy.colors.mutedForeground
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

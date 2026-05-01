import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/button/fyarn_button.dart';
import 'package:test_app/components/ui/shared_app_bar.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Buttons'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle(title: 'Variantes', fy: fy),
              const SizedBox(height: 16),
              _VariantsGrid(fy: fy),
              const SizedBox(height: 40),
              _SectionTitle(title: 'Tamanhos', fy: fy),
              const SizedBox(height: 16),
              _SizesColumn(fy: fy),
              const SizedBox(height: 40),
              _SectionTitle(title: 'Formas', fy: fy),
              const SizedBox(height: 16),
              _ShapesRow(fy: fy),
              const SizedBox(height: 40),
              _SectionTitle(title: 'Estados', fy: fy),
              const SizedBox(height: 16),
              _StatesRow(fy: fy),
            ],
          ),
        ),
      ),
    );
  }
}

class _VariantsGrid extends StatelessWidget {
  final FyarnTokens fy;
  const _VariantsGrid({required this.fy});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        FyarnButton(text: 'Default', onPressed: () {}),
        FyarnButton(text: 'Secondary', variant: FyarnButtonVariant.secondary, onPressed: () {}),
        FyarnButton(text: 'Outline', variant: FyarnButtonVariant.outline, onPressed: () {}),
        FyarnButton(text: 'Ghost', variant: FyarnButtonVariant.ghost, onPressed: () {}),
        FyarnButton(text: 'Destructive', variant: FyarnButtonVariant.destructive, onPressed: () {}),
      ],
    );
  }
}

class _SizesColumn extends StatelessWidget {
  final FyarnTokens fy;
  const _SizesColumn({required this.fy});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FyarnButton(text: 'Small Button', size: FyarnButtonSize.sm, onPressed: () {}),
        const SizedBox(height: 12),
        FyarnButton(text: 'Default Button', size: FyarnButtonSize.md, onPressed: () {}),
        const SizedBox(height: 12),
        FyarnButton(text: 'Large Button', size: FyarnButtonSize.lg, onPressed: () {}),
        const SizedBox(height: 12),
        Row(
          children: [
            FyarnButton(
              size: FyarnButtonSize.icon,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 12),
            FyarnButton(
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.send_rounded, size: 18),
                  SizedBox(width: 8),
                  Text('Send Message'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ShapesRow extends StatelessWidget {
  final FyarnTokens fy;
  const _ShapesRow({required this.fy});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        FyarnButton(text: 'Default (Rounded)', shape: FyarnButtonShape.rounded, onPressed: () {}),
        FyarnButton(text: 'Square', shape: FyarnButtonShape.square, onPressed: () {}),
        FyarnButton(text: 'Pill', shape: FyarnButtonShape.pill, onPressed: () {}),
      ],
    );
  }
}

class _StatesRow extends StatelessWidget {
  final FyarnTokens fy;
  const _StatesRow({required this.fy});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        FyarnButton(text: 'Loading', isLoading: true, onPressed: () {}),
        FyarnButton(text: 'Disabled', onPressed: null),
      ],
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

import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/text/fyarn_text.dart';
import '../components/ui/accordion/fyarn_accordion.dart';
import '../components/ui/shared_app_bar.dart';

class AccordionPage extends StatelessWidget {
  const AccordionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    final List<FyarnAccordionItem> mockItems = [
      FyarnAccordionItem(
        title: 'Premium Design Philosophy',
        content:
            'Our system prioritizes visual excellence through glassmorphism, depth-aware shadows, and semantic tokenization. Every component is designed to feel premium and responsive.',
        leading: const Icon(Icons.auto_awesome, size: 20),
      ),
      FyarnAccordionItem(
        title: 'Atomic Architecture',
        content:
            'Built on a foundation of atomic design principles, ensuring scalability and consistency across your entire application ecosystem.',
        leading: const Icon(Icons.layers, size: 20),
      ),
      FyarnAccordionItem(
        title: 'High-Fidelity Typography',
        content:
            'Meticulously calculated line heights and letter spacing provide a superior reading experience, following high-end industry standards.',
        leading: const Icon(Icons.text_fields, size: 20),
      ),
    ];

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Premium Accordion'),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(fy.spacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FyarnText(
                text: 'Separated Variant',
                variant: FyarnTextVariant.h4,
                fontWeight: FontWeight.bold,
              ),
              const FyarnText(
                text: 'Floating cards with dynamic shadows and primary tint.',
                variant: FyarnTextVariant.bodySmall,
              ),
              SizedBox(height: fy.spacing.lg),
              FyarnAccordion(
                items: mockItems,
                variant: FyarnAccordionVariant.separated,
              ),
              SizedBox(height: fy.spacing.xxl),
              const FyarnText(
                text: 'Bordered Variant',
                variant: FyarnTextVariant.h4,
                fontWeight: FontWeight.bold,
              ),
              const FyarnText(
                text: 'A clean, unified container with internal dividers.',
                variant: FyarnTextVariant.bodySmall,
              ),
              SizedBox(height: fy.spacing.lg),
              FyarnAccordion(
                items: mockItems,
                variant: FyarnAccordionVariant.bordered,
              ),
              SizedBox(height: fy.spacing.xxl),
              const FyarnText(
                text: 'Ghost Variant',
                variant: FyarnTextVariant.h4,
                fontWeight: FontWeight.bold,
              ),
              const FyarnText(
                text: 'Minimalist approach with simple separators.',
                variant: FyarnTextVariant.bodySmall,
              ),
              SizedBox(height: fy.spacing.lg),
              FyarnAccordion(
                items: mockItems,
                variant: FyarnAccordionVariant.ghost,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

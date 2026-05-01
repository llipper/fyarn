import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnCard extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget content;
  final List<Widget>? actions;

  const FyarnCard({
    super.key,
    this.title,
    this.subtitle,
    required this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Container(
      decoration: BoxDecoration(
        color: fy.colors.card,
        borderRadius: fy.shapes.borderRadiusLg,
        border: Border.all(color: fy.colors.border),
        boxShadow: fy.shapes.lg > 0 ? [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), offset: const Offset(0, 1), blurRadius: 2)
        ] : [],
      ),
      child: Padding(
        padding: EdgeInsets.all(fy.spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) ...[
              DefaultTextStyle(
                style: fy.typography.h3,
                child: title!,
              ),
              SizedBox(height: fy.spacing.xs),
            ],
            if (subtitle != null) ...[
              DefaultTextStyle(
                style: fy.typography.bodySmall.copyWith(color: fy.colors.mutedForeground),
                child: subtitle!,
              ),
              SizedBox(height: fy.spacing.md),
            ],
            DefaultTextStyle(
              style: fy.typography.bodyMedium,
              child: content,
            ),
            if (actions != null && actions!.isNotEmpty) ...[
              SizedBox(height: fy.spacing.lg),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: actions!.map((action) => Padding(
                  padding: EdgeInsets.only(bottom: action == actions!.last ? 0 : fy.spacing.sm),
                  child: action,
                )).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}




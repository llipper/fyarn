import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnCommand extends StatelessWidget {
  final String? placeholder;
  final List<Widget> children;

  const FyarnCommand({
    super.key,
    this.placeholder = "Type a command or search...",
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: fy.colors.card,
        borderRadius: BorderRadius.circular(fy.shapes.lg),
        border: Border.all(color: fy.colors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(fy.spacing.sm),
            child: Row(
              children: [
                Icon(Icons.search, size: 18, color: fy.colors.mutedForeground),
                SizedBox(width: fy.spacing.sm),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: placeholder,
                      hintStyle: fy.typography.bodySmall.copyWith(color: fy.colors.mutedForeground),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: fy.colors.border),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child: ListView(
              shrinkWrap: true,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

class FyarnCommandGroup extends StatelessWidget {
  final String heading;
  final List<Widget> children;

  const FyarnCommandGroup({
    super.key,
    required this.heading,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(fy.spacing.md, fy.spacing.sm, fy.spacing.md, fy.spacing.xs),
          child: Text(
            heading,
            style: fy.typography.labelMedium.copyWith(color: fy.colors.mutedForeground),
          ),
        ),
        ...children,
      ],
    );
  }
}

class FyarnCommandItem extends StatelessWidget {
  final Widget child;
  final VoidCallback? onSelect;
  final Widget? shortcut;

  const FyarnCommandItem({
    super.key,
    required this.child,
    this.onSelect,
    this.shortcut,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return InkWell(
      onTap: onSelect,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: fy.spacing.sm, vertical: fy.spacing.xs),
        child: Row(
          children: [
            Expanded(
              child: DefaultTextStyle(
                style: fy.typography.bodySmall.copyWith(color: fy.colors.foreground),
                child: child,
              ),
            ),
            if (shortcut != null) shortcut!,
          ],
        ),
      ),
    );
  }
}




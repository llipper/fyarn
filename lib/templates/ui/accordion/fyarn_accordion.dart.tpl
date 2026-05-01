import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';
import '../../ui/text/fyarn_text.dart';

enum FyarnAccordionVariant {
  bordered,
  ghost,
  separated,
}

class FyarnAccordion extends StatefulWidget {
  final List<FyarnAccordionItem> items;
  final bool allowMultiple;
  final FyarnAccordionVariant variant;
  final EdgeInsetsGeometry? padding;
  final bool animateExpansion;

  const FyarnAccordion({
    super.key,
    required this.items,
    this.allowMultiple = false,
    this.variant = FyarnAccordionVariant.bordered,
    this.padding,
    this.animateExpansion = true,
  });

  @override
  State<FyarnAccordion> createState() => _FyarnAccordionState();
}

class _FyarnAccordionState extends State<FyarnAccordion> {
  final Set<int> _expandedIndices = {};

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        children: List.generate(widget.items.length, (index) {
          final isExpanded = _expandedIndices.contains(index);
          final isFirst = index == 0;
          final isLast = index == widget.items.length - 1;

          return _AccordionItemWidget(
            item: widget.items[index],
            isExpanded: isExpanded,
            isFirst: isFirst,
            isLast: isLast,
            variant: widget.variant,
            onToggle: () => _toggleItem(index),
            animateExpansion: widget.animateExpansion,
          );
        }),
      ),
    );
  }

  void _toggleItem(int index) {
    setState(() {
      if (_expandedIndices.contains(index)) {
        _expandedIndices.remove(index);
      } else {
        if (!widget.allowMultiple) {
          _expandedIndices.clear();
        }
        _expandedIndices.add(index);
      }
    });
  }
}

class FyarnAccordionItem {
  final String title;
  final String? content;
  final Widget? child;
  final Widget? leading;
  final Widget? trailing;

  FyarnAccordionItem({
    required this.title,
    this.content,
    this.child,
    this.leading,
    this.trailing,
  }) : assert(content != null || child != null,
            'You must provide either content or child');
}

class _AccordionItemWidget extends StatelessWidget {
  final FyarnAccordionItem item;
  final bool isExpanded;
  final bool isFirst;
  final bool isLast;
  final FyarnAccordionVariant variant;
  final VoidCallback onToggle;
  final bool animateExpansion;

  const _AccordionItemWidget({
    required this.item,
    required this.isExpanded,
    required this.isFirst,
    required this.isLast,
    required this.variant,
    required this.onToggle,
    required this.animateExpansion,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    final decoration = _buildDecoration(fy);
    final margin = _buildMargin(fy);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: margin,
      decoration: decoration,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: _getBorderRadius(fy),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: fy.spacing.xl,
                vertical: fy.spacing.lg,
              ),
              child: Row(
                children: [
                  if (item.leading != null) ...[
                    item.leading!,
                    SizedBox(width: fy.spacing.md),
                  ],
                  Expanded(
                    child: FyarnText(
                      text: item.title,
                      variant: FyarnTextVariant.bodyLarge,
                      fontWeight: isExpanded ? FontWeight.bold : FontWeight.w600,
                      color: isExpanded ? fy.colors.primary : fy.colors.foreground,
                    ),
                  ),
                  if (item.trailing != null) ...[
                    item.trailing!,
                    SizedBox(width: fy.spacing.md),
                  ],
                  AnimatedRotation(
                    duration: animateExpansion 
                        ? const Duration(milliseconds: 300) 
                        : Duration.zero,
                    turns: isExpanded ? 0.5 : 0,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: isExpanded ? fy.colors.primary : fy.colors.mutedForeground,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (animateExpansion)
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: isExpanded ? 1.0 : 0.0,
                child: isExpanded
                    ? _buildContent(fy)
                    : const SizedBox.shrink(),
              ),
            )
          else if (isExpanded)
            _buildContent(fy),
        ],
      ),
    );
  }

  Widget _buildContent(FyarnTokens fy) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        fy.spacing.xl,
        0,
        fy.spacing.xl,
        fy.spacing.xl,
      ),
      child: item.child ??
          FyarnText(
            text: item.content ?? '',
            variant: FyarnTextVariant.bodyMedium,
            color: fy.colors.mutedForeground,
            height: 1.5,
          ),
    );
  }

  Decoration _buildDecoration(FyarnTokens fy) {
    if (variant == FyarnAccordionVariant.separated) {
      return BoxDecoration(
        color: fy.colors.card,
        borderRadius: fy.shapes.borderRadiusMd,
        border: Border.all(
          color: isExpanded 
              ? fy.colors.primary.withOpacity(0.25) 
              : fy.colors.border,
        ),
        boxShadow: isExpanded
            ? [
                BoxShadow(
                  color: fy.colors.primary.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                )
              ]
            : null,
      );
    } else if (variant == FyarnAccordionVariant.bordered) {
      return BoxDecoration(
        color: fy.colors.card,
        border: Border.all(color: fy.colors.border),
        borderRadius: BorderRadius.vertical(
          top: isFirst ? Radius.circular(fy.shapes.md) : Radius.zero,
          bottom: isLast ? Radius.circular(fy.shapes.md) : Radius.zero,
        ),
      );
    } else {
      return BoxDecoration(
        border: Border(
          bottom: isLast 
              ? BorderSide.none 
              : BorderSide(color: fy.colors.border),
        ),
      );
    }
  }

  EdgeInsetsGeometry _buildMargin(FyarnTokens fy) {
    return variant == FyarnAccordionVariant.separated
        ? EdgeInsets.only(bottom: fy.spacing.md)
        : EdgeInsets.zero;
  }

  BorderRadius? _getBorderRadius(FyarnTokens fy) {
    if (variant == FyarnAccordionVariant.separated) {
      return fy.shapes.borderRadiusMd;
    } else if (variant == FyarnAccordionVariant.bordered) {
      return BorderRadius.vertical(
        top: isFirst ? Radius.circular(fy.shapes.md) : Radius.zero,
        bottom: isLast ? Radius.circular(fy.shapes.md) : Radius.zero,
      );
    }
    return null;
  }
}



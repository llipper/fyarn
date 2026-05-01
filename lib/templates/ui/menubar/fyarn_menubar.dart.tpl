import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnMenubar extends StatelessWidget {
  final List<FyarnMenubarGroup> groups;

  const FyarnMenubar({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fy.spacing.xs, vertical: fy.spacing.xxs),
      decoration: BoxDecoration(
        color: fy.colors.card,
        border: Border.all(color: fy.colors.border),
        borderRadius: BorderRadius.circular(fy.shapes.md),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: groups,
      ),
    );
  }
}

class FyarnMenubarGroup extends StatelessWidget {
  final String title;
  final List<FyarnMenubarItem> items;

  const FyarnMenubarGroup({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return InkWell(
      onTap: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay = Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;
        
        // Calculate the bottom position of the button
        final buttonPosition = button.localToGlobal(Offset.zero, ancestor: overlay);
        final RelativeRect position = RelativeRect.fromLTRB(
          buttonPosition.dx,
          buttonPosition.dy + button.size.height, // Starts AFTER the button height
          buttonPosition.dx + button.size.width,
          buttonPosition.dy + button.size.height,
        );

        showMenu(
          context: context,
          position: position,
          items: items.map((item) => PopupMenuItem(child: item)).toList(),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(fy.shapes.md),
            side: BorderSide(color: fy.colors.border),
          ),
          color: fy.colors.card,
        );
      },
      borderRadius: BorderRadius.circular(fy.shapes.sm),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: fy.spacing.sm, vertical: fy.spacing.xs),
        child: Text(
          title,
          style: fy.typography.bodySmall.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class FyarnMenubarItem extends StatelessWidget {
  final String label;
  final String? shortcut;
  final VoidCallback? onTap;

  const FyarnMenubarItem({
    super.key,
    required this.label,
    this.shortcut,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: fy.typography.bodySmall,
          ),
        ),
        if (shortcut != null)
          Text(
            shortcut!,
            style: fy.typography.labelMedium.copyWith(color: fy.colors.mutedForeground),
          ),
      ],
    );
  }
}




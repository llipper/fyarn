import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnContextMenu extends StatelessWidget {
  final Widget child;
  final List<FyarnContextMenuItem> items;

  const FyarnContextMenu({
    super.key,
    required this.child,
    required this.items,
  });

  void _displayMenu(BuildContext context, Offset globalPosition, FyarnTokens fy) {
    final RenderBox overlay = Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(globalPosition, globalPosition),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      items: items.map((item) => PopupMenuItem(
        child: item,
        onTap: item.onTap,
      )).toList(),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(fy.shapes.md),
        side: BorderSide(color: fy.colors.border),
      ),
      color: fy.colors.card,
    );
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return GestureDetector(
      onSecondaryTapDown: (details) => _displayMenu(context, details.globalPosition, fy),
      onLongPressStart: (details) => _displayMenu(context, details.globalPosition, fy),
      child: child,
    );
  }
}

class FyarnContextMenuItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;

  const FyarnContextMenuItem({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 16, color: fy.colors.mutedForeground),
          SizedBox(width: fy.spacing.sm),
        ],
        Expanded(
          child: Text(
            label,
            style: fy.typography.bodySmall.copyWith(color: fy.colors.foreground),
          ),
        ),
      ],
    );
  }
}



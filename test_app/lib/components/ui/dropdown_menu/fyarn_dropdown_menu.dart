import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnDropdownMenu extends StatelessWidget {
  final Widget trigger;
  final List<FyarnDropdownMenuItem> items;

  const FyarnDropdownMenu({
    super.key,
    required this.trigger,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return InkWell(
      onTap: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay =
            Navigator.of(context).overlay!.context.findRenderObject()
                as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(Offset.zero, ancestor: overlay),
            button.localToGlobal(
              button.size.bottomLeft(Offset.zero),
              ancestor: overlay,
            ),
          ),
          Offset.zero & overlay.size,
        );

        showMenu(
          context: context,
          position: position,
          items: items
              .map((item) => PopupMenuItem(child: item, onTap: item.onTap))
              .toList(),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(fy.shapes.md),
            side: BorderSide(color: fy.colors.border),
          ),
          color: fy.colors.card,
        );
      },
      child: trigger,
    );
  }
}

class FyarnDropdownMenuItem extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const FyarnDropdownMenuItem({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return DefaultTextStyle(
      style: fy.typography.bodySmall.copyWith(color: fy.colors.foreground),
      child: child,
    );
  }
}

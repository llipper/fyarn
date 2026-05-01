import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnCombobox<T> extends StatelessWidget {
  final T? value;
  final List<FyarnComboboxItem<T>> items;
  final String placeholder;
  final ValueChanged<T?> onChanged;

  const FyarnCombobox({
    super.key,
    this.value,
    required this.items,
    this.placeholder = 'Select item...',
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return InkWell(
      onTap: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay = Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(Offset.zero, ancestor: overlay),
            button.localToGlobal(button.size.bottomLeft(Offset.zero), ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        );

        showMenu<T>(
          context: context,
          position: position,
          items: items.map((item) => PopupMenuItem<T>(
            value: item.value,
            child: Text(item.label, style: fy.typography.bodySmall),
          )).toList(),
          color: fy.colors.card,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(fy.shapes.md),
            side: BorderSide(color: fy.colors.border),
          ),
        ).then((selectedValue) {
          if (selectedValue != null) onChanged(selectedValue);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: fy.spacing.md, vertical: fy.spacing.sm),
        decoration: BoxDecoration(
          color: fy.colors.input,
          borderRadius: BorderRadius.circular(fy.shapes.md),
          border: Border.all(color: fy.colors.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value == null 
                ? placeholder 
                : items.firstWhere((item) => item.value == value).label,
              style: fy.typography.bodySmall.copyWith(
                color: value == null ? fy.colors.mutedForeground : fy.colors.foreground,
              ),
            ),
            Icon(Icons.unfold_more, size: 16, color: fy.colors.mutedForeground),
          ],
        ),
      ),
    );
  }
}

class FyarnComboboxItem<T> {
  final T value;
  final String label;

  const FyarnComboboxItem({required this.value, required this.label});
}




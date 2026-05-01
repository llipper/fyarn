import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnRadioGroup<T> extends StatelessWidget {
  final T value;
  final List<FyarnRadioItem<T>> items;
  final ValueChanged<T?> onChanged;

  const FyarnRadioGroup({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => RadioListTile<T>(
        title: Text(item.label),
        value: item.value,
        groupValue: value,
        onChanged: onChanged,
        activeColor: context.fy.colors.primary,
        contentPadding: EdgeInsets.zero,
      )).toList(),
    );
  }
}

class FyarnRadioItem<T> {
  final T value;
  final String label;

  const FyarnRadioItem({required this.value, required this.label});
}




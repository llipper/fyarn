import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final List<Widget>? actions;

  const FyarnDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget title,
    required Widget content,
    List<Widget>? actions,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) =>
          FyarnDialog(title: title, content: content, actions: actions),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return AlertDialog(
      backgroundColor: fy.colors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(fy.shapes.lg),
        side: BorderSide(color: fy.colors.border),
      ),
      title: DefaultTextStyle(style: fy.typography.h3, child: title),
      content: DefaultTextStyle(
        style: fy.typography.bodyMedium,
        child: content,
      ),
      actions: actions,
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnSheet extends StatelessWidget {
  final Widget title;
  final Widget content;
  final List<Widget>? footer;

  const FyarnSheet({
    super.key,
    required this.title,
    required this.content,
    this.footer,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget title,
    required Widget content,
    List<Widget>? footer,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FyarnSheet(
        title: title,
        content: content,
        footer: footer,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: fy.colors.card,
        borderRadius: BorderRadius.vertical(top: Radius.circular(fy.shapes.lg)),
        border: Border(top: BorderSide(color: fy.colors.border)),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(fy.spacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle(
                style: fy.typography.h3.copyWith(color: fy.colors.foreground),
                child: title,
              ),
              SizedBox(height: fy.spacing.md),
              DefaultTextStyle(
                style: fy.typography.bodyMedium.copyWith(color: fy.colors.foreground),
                child: content,
              ),
              if (footer != null) ...[
                SizedBox(height: fy.spacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: footer!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}



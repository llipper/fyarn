import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnDrawer extends StatelessWidget {
  final Widget title;
  final Widget content;
  final List<Widget>? footer;
  final bool isRight;

  const FyarnDrawer({
    super.key,
    required this.title,
    required this.content,
    this.footer,
    this.isRight = false,
  });

  static void show(
    BuildContext context, {
    required Widget title,
    required Widget content,
    List<Widget>? footer,
    bool isRight = false,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Drawer',
      pageBuilder: (context, anim1, anim2) {
        return FyarnDrawer(
          title: title,
          content: content,
          footer: footer,
          isRight: isRight,
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        final begin = Offset(isRight ? 1.0 : -1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        return SlideTransition(position: anim1.drive(tween), child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Align(
      alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 300,
          height: double.infinity,
          decoration: BoxDecoration(
            color: fy.colors.card,
            border: Border(
              left: isRight
                  ? BorderSide(color: fy.colors.border)
                  : BorderSide.none,
              right: !isRight
                  ? BorderSide(color: fy.colors.border)
                  : BorderSide.none,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: EdgeInsets.all(fy.spacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextStyle(
                          style: fy.typography.h3.copyWith(
                            color: fy.colors.foreground,
                          ),
                          child: title,
                        ),
                        SizedBox(height: fy.spacing.md),
                        Expanded(
                          child: DefaultTextStyle(
                            style: fy.typography.bodyMedium.copyWith(
                              color: fy.colors.foreground,
                            ),
                            child: content,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (footer != null)
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: EdgeInsets.all(fy.spacing.lg),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: footer!,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

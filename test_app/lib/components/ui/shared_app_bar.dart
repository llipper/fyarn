import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:test_app/components/core/theme/theme_controller.dart';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'text/fyarn_text.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showBackButton;
  final bool centerTitle;
  final bool showThemeSelector;

  const SharedAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.showBackButton = true,
    this.centerTitle = false,
    this.showThemeSelector = true,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    final canPop = Navigator.of(context).canPop();

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            color: fy.colors.background.withOpacity(0.8),
            border: Border(
              bottom: BorderSide(
                color: fy.colors.border.withOpacity(0.5),
                width: 1,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: centerTitle,
            leading: leading ??
                (showBackButton && canPop
                    ? IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: fy.colors.foreground,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    : null),
            title: FyarnText(
              text: title,
              variant: FyarnTextVariant.h4,
              fontWeight: FontWeight.bold,
            ),
            actions: [
              if (showThemeSelector)
                IconButton(
                  icon: Icon(
                    Theme.of(context).brightness == Brightness.dark
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                    color: fy.colors.foreground,
                  ),
                  onPressed: () {
                    ThemeController.instance.toggleBrightness();
                  },
                ),
              if (actions != null) ...actions!,
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

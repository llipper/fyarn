import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnToggle extends StatefulWidget {
  final Widget child;
  final bool initialPressed;
  final ValueChanged<bool>? onChanged;

  const FyarnToggle({
    super.key,
    required this.child,
    this.initialPressed = false,
    this.onChanged,
  });

  @override
  State<FyarnToggle> createState() => _FyarnToggleState();
}

class _FyarnToggleState extends State<FyarnToggle> {
  late bool _isPressed;

  @override
  void initState() {
    super.initState();
    _isPressed = widget.initialPressed;
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return InkWell(
      onTap: () {
        setState(() => _isPressed = !_isPressed);
        widget.onChanged?.call(_isPressed);
      },
      borderRadius: BorderRadius.circular(fy.shapes.md),
      child: Container(
        padding: EdgeInsets.all(fy.spacing.sm),
        decoration: BoxDecoration(
          color: _isPressed ? fy.colors.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(fy.shapes.md),
          border: Border.all(
            color: _isPressed ? fy.colors.ring : fy.colors.border,
          ),
        ),
        child: child,
      ),
    );
  }

  Widget get child => DefaultTextStyle.merge(
    style: TextStyle(
      color: _isPressed ? context.fyColors.accentForeground : context.fyColors.foreground,
    ),
    child: widget.child,
  );
}




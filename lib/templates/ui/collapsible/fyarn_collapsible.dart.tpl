import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnCollapsible extends StatefulWidget {
  final Widget trigger;
  final Widget content;
  final bool initiallyExpanded;

  const FyarnCollapsible({
    super.key,
    required this.trigger,
    required this.content,
    this.initiallyExpanded = false,
  });

  @override
  State<FyarnCollapsible> createState() => _FyarnCollapsibleState();
}

class _FyarnCollapsibleState extends State<FyarnCollapsible> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: _toggle,
          borderRadius: BorderRadius.circular(fy.shapes.sm),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: fy.spacing.xs),
            child: Row(
              children: [
                Expanded(child: widget.trigger),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 0.5).animate(_animation),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: fy.colors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          axisAlignment: -1.0,
          child: Padding(
            padding: EdgeInsets.only(
              top: fy.spacing.xxs,
              bottom: fy.spacing.xs,
            ),
            child: widget.content,
          ),
        ),
      ],
    );
  }
}



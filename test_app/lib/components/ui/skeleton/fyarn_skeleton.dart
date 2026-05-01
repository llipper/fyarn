import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnSkeleton extends StatefulWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const FyarnSkeleton({super.key, this.width, this.height, this.borderRadius});

  @override
  State<FyarnSkeleton> createState() => _FyarnSkeletonState();
}

class _FyarnSkeletonState extends State<FyarnSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [fy.colors.muted, fy.colors.card, fy.colors.muted],
              stops: [
                (_animation.value - 1).clamp(0, 1),
                _animation.value.clamp(0, 1),
                (_animation.value + 1).clamp(0, 1),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnBarChart extends StatefulWidget {
  final List<double> data;
  final List<String> labels;
  final double height;
  final String? valuePrefix;
  final String? valueSuffix;

  const FyarnBarChart({
    super.key,
    required this.data,
    required this.labels,
    this.height = 200,
    this.valuePrefix = '',
    this.valueSuffix = '',
  });

  @override
  State<FyarnBarChart> createState() => _FyarnBarChartState();
}

class _FyarnBarChartState extends State<FyarnBarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuart,
    );
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant FyarnBarChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    final maxVal = widget.data.isEmpty
        ? 1.0
        : widget.data.reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: widget.height,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(widget.data.length, (index) {
              final rawValue = widget.data[index];
              final ratio = (rawValue / maxVal) * _animation.value;
              final formattedValue =
                  '${widget.valuePrefix}${rawValue.toStringAsFixed(0)}${widget.valueSuffix}';

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: fy.spacing.xs),
                  child: Tooltip(
                    message: '${widget.labels[index]}: $formattedValue',
                    decoration: BoxDecoration(
                      color: fy.colors.foreground,
                      borderRadius: BorderRadius.circular(fy.shapes.sm),
                    ),
                    textStyle: fy.typography.labelMedium.copyWith(
                      color: fy.colors.background,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 40),
                          height: (widget.height - 40) * ratio,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                fy.colors.primary,
                                fy.colors.primary.withOpacity(0.7),
                              ],
                            ),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(fy.shapes.sm),
                              bottom: const Radius.circular(2),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: fy.colors.primary.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: fy.spacing.sm),
                        Text(
                          widget.labels[index],
                          style: fy.typography.labelMedium.copyWith(
                            color: fy.colors.mutedForeground,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnCarousel extends StatefulWidget {
  final List<Widget> items;
  final double height;

  const FyarnCarousel({super.key, required this.items, this.height = 200});

  @override
  State<FyarnCarousel> createState() => _FyarnCarouselState();
}

class _FyarnCarouselState extends State<FyarnCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView(
            controller: _controller,
            onPageChanged: (index) => setState(() => _currentPage = index),
            children: widget.items.map((item) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: fy.spacing.xs),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(fy.shapes.lg),
                ),
                clipBehavior: Clip.antiAlias,
                child: item,
              );
            }).toList(),
          ),
        ),
        SizedBox(height: fy.spacing.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.items.length, (index) {
            final isSelected = index == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSelected ? 24 : 8,
              height: 8,
              margin: EdgeInsets.symmetric(horizontal: fy.spacing.xxs),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(fy.shapes.full),
                color: isSelected
                    ? fy.colors.primary
                    : fy.colors.primary.withOpacity(0.2),
              ),
            );
          }),
        ),
      ],
    );
  }
}

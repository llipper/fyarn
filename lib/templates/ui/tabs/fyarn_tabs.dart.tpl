import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnTabs extends StatelessWidget {
  final List<FyarnTabItem> tabs;
  final int initialIndex;
  final double? contentHeight;
  final bool isScrollable;

  const FyarnTabs({
    super.key,
    required this.tabs,
    this.initialIndex = 0,
    this.contentHeight,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: fy.colors.muted.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(fy.shapes.md),
            ),
            padding: EdgeInsets.all(fy.spacing.xxs),
            child: TabBar(
              isScrollable: isScrollable,
              tabAlignment: isScrollable ? TabAlignment.start : TabAlignment.fill,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: fy.colors.card,
                borderRadius: BorderRadius.circular(fy.shapes.sm),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              dividerColor: Colors.transparent,
              labelColor: fy.colors.foreground,
              unselectedLabelColor: fy.colors.mutedForeground,
              labelStyle: fy.typography.bodySmall.copyWith(fontWeight: FontWeight.w600),
              unselectedLabelStyle: fy.typography.bodySmall,
              tabs: tabs.map((tab) => Tab(
                height: 32,
                text: tab.label,
              )).toList(),
            ),
          ),
          SizedBox(height: fy.spacing.md),
          SizedBox(
            height: contentHeight ?? 300,
            child: TabBarView(
              children: tabs.map((tab) => tab.content).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FyarnTabItem {
  final String label;
  final Widget content;

  FyarnTabItem({required this.label, required this.content});
}





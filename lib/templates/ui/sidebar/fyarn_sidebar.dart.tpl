import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnSidebar extends StatelessWidget {
  final Widget? header;
  final List<FyarnSidebarSection> sections;
  final Widget? footer;
  final String? activeId;
  final Function(String id)? onItemSelected;

  const FyarnSidebar({
    super.key,
    this.header,
    required this.sections,
    this.footer,
    this.activeId,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Container(
      width: 280,
      height: double.infinity,
      decoration: BoxDecoration(
        color: fy.colors.background,
        border: Border(
          right: BorderSide(color: fy.colors.border, width: 1),
        ),
      ),
      child: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null) 
            Padding(
              padding: EdgeInsets.all(fy.spacing.xl),
              child: header!,
            ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: fy.spacing.md),
              itemCount: sections.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final section = sections[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (section.title != null)
                      Padding(
                        padding: EdgeInsets.only(
                          left: fy.spacing.md,
                          bottom: fy.spacing.sm,
                        ),
                        child: Text(
                          section.title!.toUpperCase(),
                          style: fy.typography.labelMedium.copyWith(
                            color: fy.colors.mutedForeground,
                            letterSpacing: 1.2,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ...section.items.map((item) => _SidebarItem(
                          item: item,
                          isActive: item.id == activeId,
                          onTap: () => onItemSelected?.call(item.id),
                        )),
                  ],
                );
              },
            ),
          ),
          if (footer != null)
            Padding(
              padding: EdgeInsets.all(fy.spacing.lg),
              child: footer!,
            ),
        ],
      ),
    ),);
  }
}

class FyarnSidebarSection {
  final String? title;
  final List<FyarnSidebarItem> items;

  const FyarnSidebarSection({this.title, required this.items});
}

class FyarnSidebarItem {
  final String id;
  final String title;
  final IconData icon;
  final Widget? trailing;

  const FyarnSidebarItem({
    required this.id,
    required this.title,
    required this.icon,
    this.trailing,
  });
}

class _SidebarItem extends StatelessWidget {
  final FyarnSidebarItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(fy.shapes.md),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: fy.spacing.md,
            vertical: fy.spacing.md,
          ),
          decoration: BoxDecoration(
            color: isActive ? fy.colors.primary.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(fy.shapes.md),
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                size: 20,
                color: isActive ? fy.colors.primary : fy.colors.mutedForeground,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.title,
                  style: fy.typography.bodyMedium.copyWith(
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    color: isActive ? fy.colors.primary : fy.colors.foreground,
                  ),
                ),
              ),
              if (item.trailing != null) item.trailing!,
            ],
          ),
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/button/fyarn_button.dart';

class FyarnPagination extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final ValueChanged<int> onPageChanged;

  const FyarnPagination({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FyarnButton(
            onPressed: currentPage > 1
                ? () => onPageChanged(currentPage - 1)
                : null,
            size: FyarnButtonSize.icon,
            variant: FyarnButtonVariant.ghost,
            child: Icon(
              Icons.chevron_left,
              size: 18,
              color: currentPage > 1
                  ? fy.colors.foreground
                  : fy.colors.mutedForeground,
            ),
          ),
          const SizedBox(width: 4),
          ..._buildPageItems(fy),
          const SizedBox(width: 4),
          FyarnButton(
            onPressed: currentPage < totalPages
                ? () => onPageChanged(currentPage + 1)
                : null,
            size: FyarnButtonSize.icon,
            variant: FyarnButtonVariant.ghost,
            child: Icon(
              Icons.chevron_right,
              size: 18,
              color: currentPage < totalPages
                  ? fy.colors.foreground
                  : fy.colors.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageItems(FyarnTokens fy) {
    List<Widget> items = [];
    const int threshold = 5;

    if (totalPages <= threshold) {
      for (int i = 1; i <= totalPages; i++) {
        items.add(
          _PageButton(
            page: i,
            isSelected: i == currentPage,
            onTap: () => onPageChanged(i),
            fy: fy,
          ),
        );
      }
    } else {
      items.add(
        _PageButton(
          page: 1,
          isSelected: 1 == currentPage,
          onTap: () => onPageChanged(1),
          fy: fy,
        ),
      );

      if (currentPage > 3) {
        items.add(_Ellipsis(fy: fy));
      }

      int start = (currentPage - 1).clamp(2, totalPages - 1);
      int end = (currentPage + 1).clamp(2, totalPages - 1);

      if (currentPage <= 3) end = 3;
      if (currentPage >= totalPages - 2) start = totalPages - 2;

      for (int i = start; i <= end; i++) {
        if (i != 1 && i != totalPages) {
          items.add(
            _PageButton(
              page: i,
              isSelected: i == currentPage,
              onTap: () => onPageChanged(i),
              fy: fy,
            ),
          );
        }
      }

      if (currentPage < totalPages - 2) {
        items.add(_Ellipsis(fy: fy));
      }

      items.add(
        _PageButton(
          page: totalPages,
          isSelected: totalPages == currentPage,
          onTap: () => onPageChanged(totalPages),
          fy: fy,
        ),
      );
    }

    return items;
  }
}

class _PageButton extends StatelessWidget {
  final int page;
  final bool isSelected;
  final VoidCallback onTap;
  final FyarnTokens fy;

  const _PageButton({
    required this.page,
    required this.isSelected,
    required this.onTap,
    required this.fy,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isSelected ? fy.colors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(fy.shapes.sm),
          border: Border.all(
            color: isSelected ? fy.colors.primary : fy.colors.border,
          ),
        ),
        child: Center(
          child: Text(
            '$page',
            style: fy.typography.bodySmall.copyWith(
              color: isSelected ? fy.colors.onPrimary : fy.colors.foreground,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class _Ellipsis extends StatelessWidget {
  final FyarnTokens fy;
  const _Ellipsis({required this.fy});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        '...',
        style: fy.typography.bodySmall.copyWith(
          color: fy.colors.mutedForeground,
        ),
      ),
    );
  }
}

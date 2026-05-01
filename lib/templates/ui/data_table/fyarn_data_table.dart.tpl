import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';

class FyarnDataTable extends StatefulWidget {
  final List<String> columns;
  final List<List<Widget>> rows;

  const FyarnDataTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  @override
  State<FyarnDataTable> createState() => _FyarnDataTableState();
}

class _FyarnDataTableState extends State<FyarnDataTable> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: fy.colors.card,
        border: Border.all(color: fy.colors.border),
        borderRadius: BorderRadius.circular(fy.shapes.md),
      ),
      clipBehavior: Clip.antiAlias,
      child: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: fy.colors.border,
            ),
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(fy.colors.muted.withOpacity(0.5)),
              dataRowColor: WidgetStateProperty.all(fy.colors.card),
              columnSpacing: fy.spacing.xl,
              horizontalMargin: fy.spacing.md,
              dividerThickness: 1,
              columns: widget.columns.map((col) => DataColumn(
                label: Text(
                  col,
                  style: fy.typography.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: fy.colors.foreground,
                  ),
                ),
              )).toList(),
              rows: widget.rows.map((row) => DataRow(
                cells: row.map((cell) => DataCell(
                  DefaultTextStyle(
                    style: fy.typography.bodySmall.copyWith(color: fy.colors.foreground),
                    child: cell,
                  ),
                )).toList(),
              )).toList(),
            ),
          ),
        ),
      ),
    );
  }
}



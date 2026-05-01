import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/tokens/tokens.dart';
import '../text/fyarn_text.dart';
import '../calendar/fyarn_calendar.dart';

class FyarnDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateSelected;
  final String? label;

  const FyarnDatePicker({
    super.key,
    this.selectedDate,
    this.onDateSelected,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          FyarnText(
            text: label!,
            variant: FyarnTextVariant.bodySmall,
            fontWeight: FontWeight.w600,
            color: fy.colors.foreground,
          ),
          const SizedBox(height: 8),
        ],
        InkWell(
          onTap: () => _showPicker(context),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: fy.spacing.lg, 
              vertical: fy.spacing.md,
            ),
            decoration: BoxDecoration(
              color: fy.colors.muted.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: fy.colors.border.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_rounded, 
                  size: 20, 
                  color: fy.colors.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FyarnText(
                    text: selectedDate == null 
                      ? 'Select date' 
                      : DateFormat('MMM dd, yyyy').format(selectedDate!),
                    variant: FyarnTextVariant.bodyMedium,
                    color: selectedDate == null ? fy.colors.mutedForeground : fy.colors.foreground,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded, 
                  size: 20, 
                  color: fy.colors.mutedForeground,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showPicker(BuildContext context) {
    final fy = context.fy;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: fy.colors.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: SafeArea(
          top: false, // Não precisamos de SafeArea no topo aqui
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: fy.colors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FyarnCalendar(
                  selectedDate: selectedDate,
                  onDateSelected: (date) {
                    if (onDateSelected != null) onDateSelected!(date);
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

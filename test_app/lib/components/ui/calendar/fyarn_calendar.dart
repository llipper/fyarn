import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/text/fyarn_text.dart';

class FyarnCalendar extends StatefulWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateSelected;

  const FyarnCalendar({super.key, this.selectedDate, this.onDateSelected});

  @override
  State<FyarnCalendar> createState() => _FyarnCalendarState();
}

class _FyarnCalendarState extends State<FyarnCalendar> {
  late DateTime _focusedDate;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
    _focusedDate = _selectedDate ?? DateTime.now();
  }

  void _onPreviousMonth() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
    });
  }

  void _onNextMonth() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Container(
      padding: EdgeInsets.all(fy.spacing.lg),
      decoration: BoxDecoration(
        color: fy.colors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: fy.colors.border.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _onPreviousMonth,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: fy.colors.foreground,
                  size: 28,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: fy.colors.muted.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              FyarnText(
                text: DateFormat('MMMM yyyy').format(_focusedDate),
                variant: FyarnTextVariant.bodyLarge,
                fontWeight: FontWeight.bold,
              ),
              IconButton(
                onPressed: _onNextMonth,
                icon: Icon(
                  Icons.chevron_right_rounded,
                  color: fy.colors.foreground,
                  size: 28,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: fy.colors.muted.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Days of week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((day) {
              return SizedBox(
                width: 40,
                child: Center(
                  child: FyarnText(
                    text: day,
                    variant: FyarnTextVariant.bodySmall,
                    color: fy.colors.mutedForeground,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),

          // Calendar Grid
          _buildCalendarGrid(context),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid(BuildContext context) {
    final fy = context.fy;
    final daysInMonth = DateTime(
      _focusedDate.year,
      _focusedDate.month + 1,
      0,
    ).day;
    final firstDayOfMonth =
        DateTime(_focusedDate.year, _focusedDate.month, 1).weekday % 7;

    // Previous month days to fill the start
    final prevMonth = DateTime(_focusedDate.year, _focusedDate.month, 0);
    final daysInPrevMonth = prevMonth.day;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 42, // 6 weeks
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        DateTime date;
        bool isCurrentMonth = true;

        if (index < firstDayOfMonth) {
          isCurrentMonth = false;
          date = DateTime(
            _focusedDate.year,
            _focusedDate.month - 1,
            daysInPrevMonth - firstDayOfMonth + index + 1,
          );
        } else if (index >= firstDayOfMonth + daysInMonth) {
          isCurrentMonth = false;
          date = DateTime(
            _focusedDate.year,
            _focusedDate.month + 1,
            index - (firstDayOfMonth + daysInMonth) + 1,
          );
        } else {
          date = DateTime(
            _focusedDate.year,
            _focusedDate.month,
            index - firstDayOfMonth + 1,
          );
        }

        final isSelected =
            _selectedDate != null &&
            date.year == _selectedDate!.year &&
            date.month == _selectedDate!.month &&
            date.day == _selectedDate!.day;

        final isToday =
            DateTime.now().year == date.year &&
            DateTime.now().month == date.month &&
            DateTime.now().day == date.day;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
            if (widget.onDateSelected != null) {
              widget.onDateSelected!(date);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected ? fy.colors.primary : Colors.transparent,
              shape: BoxShape.circle,
              border: isToday && !isSelected
                  ? Border.all(
                      color: fy.colors.primary.withOpacity(0.5),
                      width: 1.5,
                    )
                  : null,
            ),
            child: Center(
              child: FyarnText(
                text: date.day.toString(),
                variant: FyarnTextVariant.bodyMedium,
                fontWeight: isSelected || isToday
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: isSelected
                    ? fy.colors.onPrimary
                    : (isCurrentMonth
                          ? fy.colors.foreground
                          : fy.colors.mutedForeground.withOpacity(0.5)),
              ),
            ),
          ),
        );
      },
    );
  }
}

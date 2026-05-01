import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/text/fyarn_text.dart';
import '../components/ui/calendar/fyarn_calendar.dart';
import '../components/ui/date_picker/fyarn_date_picker.dart';
import '../components/ui/shared_app_bar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Calendar'),
      body: ListView(
        padding: EdgeInsets.all(fy.spacing.xl),
        children: [
          const FyarnText(
            text: 'Premium Calendar',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          FyarnText(
            text: 'A theme-aware calendar component for date selection.',
            variant: FyarnTextVariant.bodyMedium,
            color: fy.colors.mutedForeground,
          ),
          SizedBox(height: fy.spacing.xl),
          
          FyarnCalendar(
            selectedDate: _selectedDate,
            onDateSelected: (date) {
              setState(() => _selectedDate = date);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${date.day}/${date.month}/${date.year}')),
              );
            },
          ),
          
          SizedBox(height: fy.spacing.xxl),
          SizedBox(height: fy.spacing.xxl),
          const Divider(),
          SizedBox(height: fy.spacing.xxl),
          
          const FyarnText(
            text: 'Date Picker Field',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          FyarnText(
            text: 'A modal-based picker triggered by an input field.',
            variant: FyarnTextVariant.bodyMedium,
            color: fy.colors.mutedForeground,
          ),
          SizedBox(height: fy.spacing.xl),
          
          FyarnDatePicker(
            label: 'Event Date',
            selectedDate: _selectedDate,
            onDateSelected: (date) {
              setState(() => _selectedDate = date);
            },
          ),
          
          SizedBox(height: fy.spacing.xxl),
        ],
      ),
    );
  }
}

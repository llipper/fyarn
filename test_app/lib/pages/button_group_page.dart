import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/text/fyarn_text.dart';
import '../components/ui/button_group/fyarn_button_group.dart';
import '../components/ui/button/fyarn_button.dart';
import '../components/ui/shared_app_bar.dart';

class ButtonGroupPage extends StatefulWidget {
  const ButtonGroupPage({super.key});

  @override
  State<ButtonGroupPage> createState() => _ButtonGroupPageState();
}

class _ButtonGroupPageState extends State<ButtonGroupPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Button Groups'),
      body: ListView(
        padding: EdgeInsets.all(fy.spacing.xl),
        children: [
          const FyarnText(
            text: 'Selection Groups',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          FyarnText(
            text: 'Grouped buttons for related actions or selections.',
            variant: FyarnTextVariant.bodyMedium,
            color: fy.colors.mutedForeground,
          ),
          SizedBox(height: fy.spacing.xl),
          
          FyarnButtonGroup(
            items: [
              FyarnButtonGroupItem(
                label: 'Week', 
                isSelected: _selectedIndex == 0,
                onPressed: () => setState(() => _selectedIndex = 0),
              ),
              FyarnButtonGroupItem(
                label: 'Month', 
                isSelected: _selectedIndex == 1,
                onPressed: () => setState(() => _selectedIndex = 1),
              ),
              FyarnButtonGroupItem(
                label: 'Year', 
                isSelected: _selectedIndex == 2,
                onPressed: () => setState(() => _selectedIndex = 2),
              ),
            ],
          ),
          
          SizedBox(height: fy.spacing.xxl),
          const Divider(),
          SizedBox(height: fy.spacing.xxl),
          
          const FyarnText(
            text: 'Icon Groups',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: fy.spacing.xl),
          
          FyarnButtonGroup(
            size: FyarnButtonSize.sm,
            items: [
              FyarnButtonGroupItem(label: 'Align Left', icon: Icons.format_align_left_rounded),
              FyarnButtonGroupItem(label: 'Align Center', icon: Icons.format_align_center_rounded),
              FyarnButtonGroupItem(label: 'Align Right', icon: Icons.format_align_right_rounded),
            ],
          ),
          
          SizedBox(height: fy.spacing.xxl),
          const Divider(),
          SizedBox(height: fy.spacing.xxl),
          
          const FyarnText(
            text: 'Sizing Options',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: fy.spacing.xl),
          
          FyarnButtonGroup(
            size: FyarnButtonSize.lg,
            items: [
              FyarnButtonGroupItem(label: 'Large Action A'),
              FyarnButtonGroupItem(label: 'Large Action B'),
            ],
          ),
        ],
      ),
    );
  }
}

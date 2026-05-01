import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/text/fyarn_text.dart';
import '../components/ui/breadcrumb/fyarn_breadcrumb.dart';
import '../components/ui/shared_app_bar.dart';

class BreadcrumbPage extends StatelessWidget {
  const BreadcrumbPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Breadcrumbs'),
      body: ListView(
        padding: EdgeInsets.all(fy.spacing.xl),
        children: [
          const FyarnText(
            text: 'Navigation Hierarchy',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          FyarnText(
            text: 'Breadcrumbs help users understand their current location in the app.',
            variant: FyarnTextVariant.bodyMedium,
            color: fy.colors.mutedForeground,
          ),
          SizedBox(height: fy.spacing.xl),
          
          const FyarnBreadcrumb(
            items: [
              FyarnBreadcrumbItem(label: 'Home'),
              FyarnBreadcrumbItem(label: 'Dashboard'),
              FyarnBreadcrumbItem(label: 'Settings'),
            ],
          ),
          
          SizedBox(height: fy.spacing.xxl),
          const Divider(),
          SizedBox(height: fy.spacing.xxl),
          
          const FyarnText(
            text: 'Interactive Breadcrumbs',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          FyarnText(
            text: 'Breadcrumbs with tap actions for easy back-navigation.',
            variant: FyarnTextVariant.bodyMedium,
            color: fy.colors.mutedForeground,
          ),
          SizedBox(height: fy.spacing.xl),
          
          FyarnBreadcrumb(
            items: [
              FyarnBreadcrumbItem(
                label: 'Library', 
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Navigating to Library'))),
              ),
              FyarnBreadcrumbItem(
                label: 'Design System',
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Navigating to Design System'))),
              ),
              const FyarnBreadcrumbItem(label: 'Breadcrumbs'),
            ],
          ),
        ],
      ),
    );
  }
}

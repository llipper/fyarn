import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/shared_app_bar.dart';
import '../components/ui/trail/fyarn_trail.dart';

class TrailPage extends StatelessWidget {
  const TrailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Trail Exploration'),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(fy.spacing.xl),
          child: Column(
            children: [
              const FyarnTrailCard(
              ),
              const SizedBox(height: 32),
              const FyarnTrailCard(
                location: 'Frostspire Range',
                imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba?auto=format&fit=crop&q=80&w=1000',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

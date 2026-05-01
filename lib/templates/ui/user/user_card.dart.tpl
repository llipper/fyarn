import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';
import '../../ui/text/fyarn_text.dart';

class FyarnUserCard extends StatelessWidget {
  final String name;
  final String role;
  final String location;
  final String avatarUrl;
  final int followers;
  final int following;
  final int projects;

  const FyarnUserCard({
    super.key,
    this.name = 'Alex Rivera',
    this.role = 'Senior Product Designer',
    this.location = 'San Francisco, CA',
    this.avatarUrl = 'https://i.pravatar.cc/300?u=alex',
    this.followers = 1240,
    this.following = 842,
    this.projects = 46,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: fy.colors.card,
        borderRadius: fy.shapes.borderRadiusLg,
        border: Border.all(color: fy.colors.border.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with Cover Image
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [fy.colors.primary, fy.colors.primary.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(fy.shapes.lg),
                  ),
                ),
              ),
              Positioned(
                bottom: -40,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: fy.colors.card,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 50),
          
          // User Info
          FyarnText(
            text: name,
            variant: FyarnTextVariant.h4,
            fontWeight: FontWeight.bold,
          ),
          FyarnText(
            text: role,
            variant: FyarnTextVariant.bodySmall,
            color: fy.colors.mutedForeground,
          ),
          
          const SizedBox(height: 16),
          
          // Stats Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fy.spacing.xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _UserStat(label: 'Projects', value: projects.toString()),
                _UserStat(label: 'Followers', value: '${(followers / 1000).toStringAsFixed(1)}k'),
                _UserStat(label: 'Following', value: following.toString()),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Action Buttons
          Padding(
            padding: EdgeInsets.fromLTRB(fy.spacing.xl, 0, fy.spacing.xl, fy.spacing.xl),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: fy.colors.primary,
                      foregroundColor: fy.colors.onPrimary,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: fy.shapes.borderRadiusFull,
                      ),
                    ),
                    child: const Text('Follow'),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: fy.colors.secondary,
                    borderRadius: fy.shapes.borderRadiusFull,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.mail_outline, color: fy.colors.secondaryContainer),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserStat extends StatelessWidget {
  final String label;
  final String value;

  const _UserStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    return Column(
      children: [
        FyarnText(
          text: value,
          variant: FyarnTextVariant.bodyLarge,
          fontWeight: FontWeight.bold,
        ),
        FyarnText(
          text: label,
          variant: FyarnTextVariant.labelSmall,
          color: fy.colors.mutedForeground,
        ),
      ],
    );
  }
}



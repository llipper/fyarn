import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/text/fyarn_text.dart';

class FyarnTrailCard extends StatefulWidget {
  final String title;
  final String location;
  final String imageUrl;
  final String distance;
  final String elevation;
  final String duration;
  final String description;
  final String author;
  final bool initiallyExpanded;

  const FyarnTrailCard({
    super.key,
    this.title = 'Embercrest Ridge',
    this.location = 'Silverpine Mountains',
    this.imageUrl =
        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&q=80&w=1000',
    this.distance = '12.4km',
    this.elevation = '870m',
    this.duration = '4h 45m',
    this.author = 'Helen Rowe & Elias Mendez',
    this.description =
        'Embercrest Ridge rises boldly from the heart of the Silverpine Mountains, its sun-warmed cliffs glowing with rich crimson and amber tones during golden hour. Towering at 3,274 meters, the ridge is framed by winding alpine trails, rugged rock formations, and sweeping meadows dotted with wildflowers.',
    this.initiallyExpanded = false,
  });

  @override
  State<FyarnTrailCard> createState() => _FyarnTrailCardState();
}

class _FyarnTrailCardState extends State<FyarnTrailCard> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: fy.colors.card,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(fy.spacing.md),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: AspectRatio(
                    aspectRatio: 1.1,
                    child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                  ),
                ),

                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                          stops: const [0.5, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FyarnText(
                              text: widget.title,
                              variant: FyarnTextVariant.h3,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            FyarnText(
                              text: widget.location,
                              variant: FyarnTextVariant.bodySmall,
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: const FyarnText(
                              text: 'Start Route',
                              variant: FyarnTextVariant.bodyMedium,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (isExpanded) ...[
            Padding(
              padding: EdgeInsets.fromLTRB(
                fy.spacing.lg,
                fy.spacing.lg,
                fy.spacing.lg,
                fy.spacing.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FyarnText(
                              text: '${widget.title} Summit Trail',
                              variant: FyarnTextVariant.bodySmall,
                              fontWeight: FontWeight.bold,
                            ),
                            FyarnText(
                              text: '1886 by ${widget.author}',
                              variant: FyarnTextVariant.bodySmall,
                              color: fy.colors.mutedForeground,
                            ),
                            Divider(color: fy.colors.border.withOpacity(0.5)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStat(fy, widget.distance, 'Distance'),
                                _buildStat(fy, widget.elevation, 'Elevation'),
                                _buildStat(fy, widget.duration, 'Duration'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 62,
                        height: 46,
                        decoration: BoxDecoration(
                          color: fy.colors.muted.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: fy.colors.border.withOpacity(0.5),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.gesture,
                            color: fy.colors.primary,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: fy.spacing.xl),

                  FyarnText(
                    text: widget.description,
                    variant: FyarnTextVariant.bodySmall,
                    color: fy.colors.mutedForeground,
                  ),
                ],
              ),
            ),
          ],

          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: fy.colors.mutedForeground,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(FyarnTokens fy, String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FyarnText(
          text: value,
          variant: FyarnTextVariant.bodyMedium,
          fontWeight: FontWeight.bold,
        ),
        FyarnText(
          text: label,
          variant: FyarnTextVariant.bodySmall,
          color: fy.colors.mutedForeground,
        ),
      ],
    );
  }
}

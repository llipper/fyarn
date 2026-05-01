import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/text/fyarn_text.dart';
import '../components/ui/carousel/fyarn_carousel.dart';
import '../components/ui/shared_app_bar.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(title: 'Carousel'),
      body: ListView(
        padding: EdgeInsets.all(fy.spacing.xl),
        children: [
          const FyarnText(
            text: 'Premium Carousel',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          FyarnText(
            text: 'Animated slider for featured content and galleries.',
            variant: FyarnTextVariant.bodyMedium,
            color: fy.colors.mutedForeground,
          ),
          SizedBox(height: fy.spacing.xl),
          
          FyarnCarousel(
            height: 250,
            items: [
              _CarouselItem(
                color: Colors.blue, 
                title: 'Adventure Awaits', 
                subtitle: 'Explore the highest peaks.',
                imageUrl: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&q=80&w=1000',
              ),
              _CarouselItem(
                color: Colors.green, 
                title: 'Urban Jungle', 
                subtitle: 'Discover the city lights.',
                imageUrl: 'https://images.unsplash.com/photo-1449034446853-66c86144b0ad?auto=format&fit=crop&q=80&w=1000',
              ),
              _CarouselItem(
                color: Colors.orange, 
                title: 'Desert Mirage', 
                subtitle: 'Peace in the golden sands.',
                imageUrl: 'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0?auto=format&fit=crop&q=80&w=1000',
              ),
            ],
          ),
          
          SizedBox(height: fy.spacing.xxl),
          const Divider(),
          SizedBox(height: fy.spacing.xxl),
          
          const FyarnText(
            text: 'Content Cards',
            variant: FyarnTextVariant.h3,
            fontWeight: FontWeight.bold,
          ),
          FyarnText(
            text: 'Carousel with complex widget items.',
            variant: FyarnTextVariant.bodyMedium,
            color: fy.colors.mutedForeground,
          ),
          SizedBox(height: fy.spacing.xl),
          
          FyarnCarousel(
            height: 120,
            items: [
              _SimpleCard(title: 'Promo 20% Off', icon: Icons.local_offer_rounded),
              _SimpleCard(title: 'New Collection', icon: Icons.new_releases_rounded),
              _SimpleCard(title: 'Free Shipping', icon: Icons.local_shipping_rounded),
            ],
          ),
        ],
      ),
    );
  }
}

class _CarouselItem extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String imageUrl;

  const _CarouselItem({
    required this.color, 
    required this.title, 
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(imageUrl, fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FyarnText(text: title, variant: FyarnTextVariant.h3, color: Colors.white, fontWeight: FontWeight.bold),
              FyarnText(text: subtitle, variant: FyarnTextVariant.bodySmall, color: Colors.white.withOpacity(0.8)),
            ],
          ),
        ),
      ],
    );
  }
}

class _SimpleCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SimpleCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    return Container(
      color: fy.colors.secondary.withOpacity(0.2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: fy.colors.primary, size: 32),
            SizedBox(height: fy.spacing.sm),
            FyarnText(text: title, variant: FyarnTextVariant.bodyLarge, fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}

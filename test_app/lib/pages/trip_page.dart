import 'package:flutter/material.dart';
import '../components/core/tokens/tokens.dart';
import '../components/ui/trip/trip_card.dart';
import '../components/ui/trip/trip_footer.dart';
import '../components/ui/shared_app_bar.dart';

class TripPage extends StatelessWidget {
  const TripPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      extendBodyBehindAppBar: true, 
      backgroundColor: fy.colors.background,
      appBar: const SharedAppBar(
        title: 'Trip Tracking', 
        showThemeSelector: true,
      ),
      body: Stack(
        children: [
          // 1. Fundo (Ocupa a tela TODA, ignorando SafeArea para o efeito de vidro)
          Positioned.fill(
            child: Container(
              color: fy.colors.muted.withOpacity(0.1),
              child: Center(
                child: Icon(
                  Icons.map_rounded,
                  size: 200,
                  color: fy.colors.mutedForeground.withOpacity(0.1),
                ),
              ),
            ),
          ),
          
          // 2. Elementos de Interface (Devem respeitar a SafeArea)
          SafeArea(
            child: Stack(
              children: [
                // Trip Card (Floating Overlay)
                Positioned(
                  top: 20, 
                  left: fy.spacing.xl,
                  right: fy.spacing.xl,
                  child: const FyarnTripCard(),
                ),
                
                // Trip Footer (Dynamic Island style)
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: FyarnTripFooter(),
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

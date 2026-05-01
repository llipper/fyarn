import 'package:flutter/material.dart';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'package:test_app/components/ui/text/fyarn_text.dart';

class FyarnMemoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String tag;
  final String imageUrl;
  final VoidCallback? onTap;

  const FyarnMemoryCard({
    super.key,
    this.title = 'Black Sea',
    this.subtitle = 'June 2025',
    this.tag = 'Memories',
    this.imageUrl =
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?auto=format&fit=crop&q=80&w=1000',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(fy.shapes.full / 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Imagem de fundo
              Image.network(imageUrl, fit: BoxFit.cover),

              // Overlay dinâmico baseado na cor primária do tema
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      fy.colors.primary.withOpacity(0.1),
                      Colors.black.withOpacity(0.6),
                    ],
                    stops: const [0.3, 1.0],
                  ),
                ),
              ),

              // Tom "Quente" do Tema
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      fy.colors.primary.withOpacity(
                        0.25,
                      ), // Dinâmico: segue o tema (Amber, Ruby, Emerald...)
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // Texto de Tag no topo (Pilar de Tipografia)
              Positioned(
                top: fy.spacing.xl,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    tag.toUpperCase(),
                    style: fy.typography.labelMedium.copyWith(
                      color: fy.colors.primary,
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Bloco inferior (Padronizado com Tokens)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    fy.spacing.xl,
                    fy.spacing.xl * 1.5,
                    fy.spacing.xl,
                    fy.spacing.xl,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black],
                      stops: [0.0, 0.5],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FyarnText(
                        text: title,
                        variant: FyarnTextVariant.h3,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      SizedBox(height: fy.spacing.xs),
                      FyarnText(
                        text: subtitle,
                        variant: FyarnTextVariant.bodySmall,
                        color: Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

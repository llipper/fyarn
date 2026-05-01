import 'package:flutter/material.dart';
import '../../ui/button/fyarn_button.dart';
import '../../ui/input/fyarn_input.dart';
import '../../ui/text/fyarn_text.dart';
import '../../core/tokens/tokens.dart';

class FyarnLoginImmersivePage extends StatelessWidget {
  const FyarnLoginImmersivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background, // Agora respeita o tema (Dark/Light)
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Imersivo Reativo
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1614850523296-d8c1af93d400?q=80&w=2070&auto=format&fit=crop'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradiente que transiciona para a cor de fundo do TEMA
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        fy.colors.background.withOpacity(0.4),
                        fy.colors.background,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'Welcome back',
                      style: fy.typography.h2.copyWith(
                        color: fy.colors.foreground,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            // Formulário que respeita o tema
            Padding(
              padding: EdgeInsets.symmetric(horizontal: fy.spacing.xl),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const FyarnInput(
                    hint: 'Email address',
                    prefixIcon: Icon(Icons.mail_outline_rounded, size: 20),
                  ),
                  const SizedBox(height: 16),
                  const FyarnInput(
                    hint: 'Password',
                    obscureText: true,
                    prefixIcon: Icon(Icons.lock_outline_rounded, size: 20),
                  ),
                  
                  const SizedBox(height: 48),
                  
                  // Botão de Email (Automático pelo FyButton)
                  FyarnButton(
                    text: 'Continue with Email',
                    onPressed: () {},
                    width: double.infinity,
                    size: FyarnButtonSize.lg,
                    shape: FyarnButtonShape.rounded,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Botão de Google Reativo
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: fy.colors.muted.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: fy.colors.border),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata_rounded, color: fy.colors.foreground, size: 28),
                          const SizedBox(width: 12),
                          Text(
                            'Continue with Google',
                            style: fy.typography.bodySmall.copyWith(
                              color: fy.colors.foreground,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 60),
                  
                  // Footer Reativo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: fy.typography.bodySmall.copyWith(color: fy.colors.mutedForeground),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Sign Up',
                          style: fy.typography.bodySmall.copyWith(
                            color: fy.colors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:test_app/components/ui/button/fyarn_button.dart';
import 'package:test_app/components/ui/input/fyarn_input.dart';
import 'package:test_app/components/ui/text/fyarn_text.dart';
import 'package:test_app/components/core/tokens/tokens.dart';
import 'signup_form.dart';

class FyarnSignupImmersivePage extends StatelessWidget {
  const FyarnSignupImmersivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Imersivo Reativo
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1614850523296-d8c1af93d400?q=80&w=2070&auto=format&fit=crop',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
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
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'Join our community',
                      style: fy.typography.h2.copyWith(
                        color: fy.colors.foreground,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Formulário de Cadastro Reativo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: fy.spacing.xl),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const FyarnSignupForm(),

                  const SizedBox(height: 32),

                  // Divisor sutil reativo
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: fy.colors.border, thickness: 0.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'OR SIGN UP WITH',
                          style: fy.typography.bodySmall.copyWith(
                            color: fy.colors.mutedForeground,
                            fontSize: 10,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: fy.colors.border, thickness: 0.5),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Google Button Reativo
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: fy.colors.muted.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: fy.colors.border),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.g_mobiledata_rounded,
                            color: fy.colors.foreground,
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Continue with Google',
                            style: fy.typography.bodySmall.copyWith(
                              color: fy.colors.foreground,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Footer Reativo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: fy.typography.bodySmall.copyWith(
                          color: fy.colors.mutedForeground,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Sign In',
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

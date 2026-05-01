import 'package:flutter/material.dart';
import 'package:test_app/components/ui/button/fyarn_button.dart';
import 'package:test_app/components/ui/input/fyarn_input.dart';
import 'package:test_app/components/ui/text/fyarn_text.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnLoginCardPage extends StatelessWidget {
  const FyarnLoginCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Colorido Dinâmico (Respeita o Tema)
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                color: fy.colors.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  // Formas Abstratas sutilmente coloridas com o Container do Tema
                  Positioned(
                    top: -20,
                    left: -20,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: fy.colors.primaryContainer.withOpacity(
                        0.3,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: -30,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: fy.colors.primaryContainer.withOpacity(
                        0.2,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Welcome back',
                          style: fy.typography.h2.copyWith(
                            color: fy.colors.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Card Principal que sobrepõe levemente o Header
            Transform.translate(
              offset: const Offset(0, -40),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: fy.spacing.xl),
                child: Container(
                  padding: EdgeInsets.all(fy.spacing.xl),
                  decoration: BoxDecoration(
                    color: fy.colors.card,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Social Login (Pill Style)
                      _PillSocialButton(
                        icon: Icons.g_mobiledata_rounded,
                        label: 'Sign in with Google',
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'or',
                        style: fy.typography.bodySmall.copyWith(
                          color: fy.colors.mutedForeground,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Inputs Reativos
                      const FyarnInput(
                        label: 'Email',
                        hint: 'Enter your email',
                        shape: FyarnInputShape.rounded, // Estilo Pílula
                      ),
                      const SizedBox(height: 16),
                      const FyarnInput(
                        label: 'Password',
                        hint: '••••••••',
                        obscureText: true,
                        shape: FyarnInputShape.rounded,
                      ),

                      const SizedBox(height: 32),

                      // Primary Button (Pill Style)
                      FyarnButton(
                        text: 'Log in',
                        onPressed: () {},
                        width: double.infinity,
                        size: FyarnButtonSize.lg,
                        shape: FyarnButtonShape.rounded,
                      ),

                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: fy.typography.bodySmall.copyWith(
                              color: fy.colors.mutedForeground,
                            ),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PillSocialButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PillSocialButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: fy.colors.card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: fy.colors.border),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: fy.colors.foreground, size: 24),
            const SizedBox(width: 12),
            Text(
              label,
              style: fy.typography.bodySmall.copyWith(
                color: fy.colors.foreground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

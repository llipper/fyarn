import 'package:flutter/material.dart';
import '../../ui/button/fyarn_button.dart';
import '../../ui/input/fyarn_input.dart';
import '../../ui/text/fyarn_text.dart';
import '../../core/tokens/tokens.dart';

class FyarnLoginMinimalPage extends StatelessWidget {
  const FyarnLoginMinimalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(fy.spacing.xl),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Logo que respeita a cor de destaque do tema
              Text(
                'FYARN',
                style: fy.typography.h1.copyWith(
                  color: fy.colors.primary,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 8),
              FyarnText(
                text: 'Sign In',
                variant: FyarnTextVariant.bodyLarge,
                color: fy.colors.mutedForeground,
              ),
              const SizedBox(height: 48),
              
              // Social Buttons que respeitam o tema
              _SocialWideButton(
                icon: Icons.g_mobiledata_rounded,
                label: 'Sign in with Google',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              _SocialWideButton(
                icon: Icons.apple_rounded,
                label: 'Sign in with Apple',
                onPressed: () {},
              ),
              
              const SizedBox(height: 32),
              // Divider sutil
              Row(
                children: [
                  Expanded(child: Divider(color: fy.colors.border, thickness: 0.5)),
                  const SizedBox(width: 40),
                  Expanded(child: Divider(color: fy.colors.border, thickness: 0.5)),
                ],
              ),
              const SizedBox(height: 32),
              
              // Form Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email address',
                    style: fy.typography.bodySmall.copyWith(
                      color: fy.colors.foreground,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const FyarnInput(
                    hint: 'Enter your email address',
                    prefixIcon: Icon(Icons.mail_outline_rounded, size: 20),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Password',
                    style: fy.typography.bodySmall.copyWith(
                      color: fy.colors.foreground,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const FyarnInput(
                    hint: '••••••••••••',
                    obscureText: true,
                    prefixIcon: Icon(Icons.lock_outline_rounded, size: 20),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: fy.typography.bodySmall.copyWith(
                      color: fy.colors.mutedForeground,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              // Primary Action (Respeita cor primária do tema)
              FyarnButton(
                text: 'Sign In',
                onPressed: () {},
                width: double.infinity,
                size: FyarnButtonSize.lg,
                shape: FyarnButtonShape.rounded,
              ),
              
              const SizedBox(height: 32),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialWideButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialWideButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: fy.colors.muted.withOpacity(0.5),
        borderRadius: fy.shapes.borderRadiusMd,
        border: Border.all(color: fy.colors.border),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: fy.shapes.borderRadiusMd,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: fy.colors.foreground, size: 24),
            const SizedBox(width: 12),
            Text(
              label,
              style: fy.typography.bodySmall.copyWith(
                color: fy.colors.foreground.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



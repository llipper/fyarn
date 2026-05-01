import 'package:flutter/material.dart';
import 'package:test_app/components/ui/button/fyarn_button.dart';
import 'package:test_app/components/ui/input/fyarn_input.dart';
import 'package:test_app/components/ui/text/fyarn_text.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnSignupMinimalPage extends StatelessWidget {
  const FyarnSignupMinimalPage({super.key});

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
              // Logo
              Text(
                'Fyarn',
                style: fy.typography.h1.copyWith(
                  color: fy.colors.primary,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 8),
              FyarnText(
                text: 'Create Account',
                variant: FyarnTextVariant.bodyLarge,
                color: fy.colors.mutedForeground,
              ),
              const SizedBox(height: 48),

              // Social Buttons
              _SocialWideButton(
                icon: Icons.g_mobiledata_rounded,
                label: 'Sign up with Google',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              _SocialWideButton(
                icon: Icons.apple_rounded,
                label: 'Sign up with Apple',
                onPressed: () {},
              ),

              const SizedBox(height: 32),
              // Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(color: fy.colors.border, thickness: 0.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR',
                      style: fy.typography.labelSmall.copyWith(
                        color: fy.colors.mutedForeground,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: fy.colors.border, thickness: 0.5),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Built-in Form
              const FyarnInput(
                label: 'Full Name',
                hint: 'John Doe',
                prefixIcon: Icon(Icons.person_outline),
              ),
              SizedBox(height: fy.spacing.md),
              const FyarnInput(
                label: 'Email Address',
                hint: 'name@example.com',
                prefixIcon: Icon(Icons.mail_outline),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: fy.spacing.md),
              const FyarnInput(
                label: 'Password',
                hint: '••••••••',
                prefixIcon: Icon(Icons.lock_outline),
                obscureText: true,
              ),
              const SizedBox(height: 32),

              FyarnButton(
                text: 'Create Account',
                onPressed: () {},
                width: double.infinity,
                size: FyarnButtonSize.lg,
              ),

              const SizedBox(height: 40),

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
                    onTap: () => Navigator.pop(context),
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
              style: fy.typography.labelMedium.copyWith(
                color: fy.colors.foreground.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

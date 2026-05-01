import 'package:flutter/material.dart';
import 'package:test_app/components/ui/button/fyarn_button.dart';
import 'package:test_app/components/ui/input/fyarn_input.dart';
import 'package:test_app/components/ui/text/fyarn_text.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnSignupSplitPage extends StatelessWidget {
  const FyarnSignupSplitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: fy.colors.background,
      body: isDesktop ? _buildDesktop(context, fy) : _buildMobile(context, fy),
    );
  }

  Widget _buildDesktop(BuildContext context, FyarnTokens fy) {
    return Row(
      children: [
        // Branding Side
        Expanded(
          flex: 5,
          child: Container(
            color: fy.colors.primary,
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 40,
                  child: Text(
                    'Fyarn',
                    style: fy.typography.h3.copyWith(
                      color: fy.colors.onPrimary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Join our community.',
                          style: fy.typography.h1.copyWith(
                            color: fy.colors.onPrimary,
                            fontSize: 56,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'The most advanced UI toolkit for Flutter developers.',
                          style: fy.typography.bodyLarge.copyWith(
                            color: fy.colors.onPrimary.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Form Side
        Expanded(
          flex: 4,
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(fy.spacing.xxl),
              child: _buildForm(context, fy),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context, FyarnTokens fy) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(fy.spacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Text(
            'Fyarn',
            style: fy.typography.h4.copyWith(
              color: fy.colors.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 40),
          _buildForm(context, fy),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, FyarnTokens fy) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FyarnText(
          text: 'Get Started',
          variant: FyarnTextVariant.h2,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 8),
        FyarnText(
          text: 'Experience the future of mobile design.',
          variant: FyarnTextVariant.bodyMedium,
          color: fy.colors.mutedForeground,
        ),
        const SizedBox(height: 40),

        const FyarnInput(label: 'Name', hint: 'John Doe'),
        SizedBox(height: fy.spacing.md),
        const FyarnInput(label: 'Email', hint: 'john@example.com'),
        SizedBox(height: fy.spacing.md),
        const FyarnInput(
          label: 'Password',
          hint: '••••••••',
          obscureText: true,
        ),

        const SizedBox(height: 32),
        FyarnButton(
          text: 'Create Account',
          onPressed: () {},
          width: double.infinity,
          size: FyarnButtonSize.lg,
        ),

        const SizedBox(height: 32),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
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
        ),
      ],
    );
  }
}

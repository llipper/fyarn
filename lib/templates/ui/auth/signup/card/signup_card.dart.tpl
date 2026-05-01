import 'package:flutter/material.dart';
import '../../ui/button/fyarn_button.dart';
import '../../ui/input/fyarn_input.dart';
import '../../ui/text/fyarn_text.dart';
import '../../core/tokens/tokens.dart';

class FyarnSignupCardPage extends StatelessWidget {
  const FyarnSignupCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Scaffold(
      backgroundColor: fy.colors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: fy.colors.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Text(
                  'Create Account',
                  style: fy.typography.h2.copyWith(
                    color: fy.colors.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            // Card
            Transform.translate(
              offset: const Offset(0, -30),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: fy.spacing.xl),
                child: Container(
                  padding: EdgeInsets.all(fy.spacing.xl),
                  decoration: BoxDecoration(
                    color: fy.colors.card,
                    borderRadius: fy.shapes.borderRadiusLg,
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
                      const FyarnInput(label: 'Full Name', hint: 'Jane Doe'),
                      SizedBox(height: fy.spacing.md),
                      const FyarnInput(label: 'Email', hint: 'jane@example.com'),
                      SizedBox(height: fy.spacing.md),
                      const FyarnInput(label: 'Password', hint: '••••••••', obscureText: true),
                      
                      const SizedBox(height: 32),
                      FyarnButton(
                        text: 'Get Started',
                        onPressed: () {},
                        width: double.infinity,
                        size: FyarnButtonSize.lg,
                        shape: FyarnButtonShape.rounded,
                      ),
                      
                      const SizedBox(height: 24),
                      Text(
                        'By signing up, you agree to our Terms and Conditions.',
                        textAlign: TextAlign.center,
                        style: fy.typography.labelSmall.copyWith(color: fy.colors.mutedForeground),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an account? ",
                            style: fy.typography.bodySmall.copyWith(color: fy.colors.mutedForeground),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              'Log in here',
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



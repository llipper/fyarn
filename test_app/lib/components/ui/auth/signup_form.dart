import 'package:flutter/material.dart';
import 'package:test_app/components/ui/button/fyarn_button.dart';
import 'package:test_app/components/ui/input/fyarn_input.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnSignupForm extends StatelessWidget {
  const FyarnSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    return Column(
      children: [
        const FyarnInput(label: 'Nome Completo', hint: 'Ex: João Silva'),
        const SizedBox(height: 16),
        const FyarnInput(label: 'Email', hint: 'email@exemplo.com'),
        const SizedBox(height: 16),
        const FyarnInput(label: 'Senha', hint: '••••••••', obscureText: true),
        const SizedBox(height: 16),
        const FyarnInput(
          label: 'Confirmar Senha',
          hint: '••••••••',
          obscureText: true,
        ),
        const SizedBox(height: 32),
        FyarnButton(
          text: 'Criar Conta',
          onPressed: () {},
          width: double.infinity,
        ),
      ],
    );
  }
}

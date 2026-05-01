import 'package:flutter/material.dart';
import 'package:test_app/components/ui/button/fyarn_button.dart';
import 'package:test_app/components/ui/input/fyarn_input.dart';
import 'package:test_app/components/ui/text/fyarn_text.dart';
import 'package:test_app/components/core/tokens/tokens.dart';

class FyarnLoginSplitPage extends StatelessWidget {
  const FyarnLoginSplitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: fy.colors.background,
      body: isDesktop ? _buildDesktop(context) : _buildMobile(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    final fy = context.fy;
    return Row(
      children: [
        // Lado Esquerdo: Branding e Gradiente
        Expanded(
          flex: 6,
          child: Container(
            color: fy.colors.primary,
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: 60,
                  child: Text(
                    'Fyarn',
                    style: fy.typography.h1.copyWith(
                      color: fy.colors.onPrimary,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A próxima geração de interfaces.',
                          style: fy.typography.h1.copyWith(
                            color: fy.colors.onPrimary,
                            fontSize: 56,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Simples, rápido e totalmente customizável.',
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
        // Lado Direito: Formulário
        Expanded(
          flex: 5,
          child: Container(
            color: fy.colors.card,
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                padding: EdgeInsets.all(fy.spacing.xxl),
                child: _buildFormContent(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    final fy = context.fy;
    return Column(
      children: [
        // Topo: Branding (Aproximadamente 25% da altura)
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          color: fy.colors.primary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: fy.colors.onPrimary.withOpacity(0.2),
                    borderRadius: fy.shapes.borderRadiusLg,
                  ),
                  child: Icon(
                    Icons.bolt_rounded,
                    color: fy.colors.onPrimary,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Fyarn',
                  style: fy.typography.h4.copyWith(
                    color: fy.colors.onPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Restante: Formulário (75%)
        Expanded(
          child: Container(
            color: fy.colors.background,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(fy.spacing.xl),
              child: _buildFormContent(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormContent(BuildContext context) {
    final fy = context.fy;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FyarnText(text: 'Acesse agora', variant: FyarnTextVariant.h2),
        const SizedBox(height: 8),
        FyarnText(
          text: 'Entre com seus dados para gerenciar seus projetos.',
          variant: FyarnTextVariant.bodyMedium,
          color: fy.colors.mutedForeground,
        ),
        const SizedBox(height: 40),
        const FyarnInput(label: 'E-mail', hint: 'seu@email.com'),
        const SizedBox(height: 20),
        const FyarnInput(label: 'Senha', hint: '••••••••', obscureText: true),
        const SizedBox(height: 32),
        FyarnButton(
          text: 'Entrar na Plataforma',
          onPressed: () {},
          width: double.infinity,
        ),
        const SizedBox(height: 32),
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Criar uma nova conta',
              style: fy.typography.bodySmall.copyWith(color: fy.colors.primary),
            ),
          ),
        ),
      ],
    );
  }
}

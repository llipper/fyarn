import 'package:flutter/material.dart';
import '../../core/tokens/tokens.dart';
import '../button/fyarn_button.dart';

class FyarnAlertDialog extends StatelessWidget {
  final String title;
  final String description;
  final String cancelLabel;
  final String actionLabel;
  final VoidCallback? onCancel;
  final VoidCallback? onAction;
  final bool isDestructive;

  const FyarnAlertDialog({
    super.key,
    required this.title,
    required this.description,
    this.cancelLabel = 'Cancel',
    this.actionLabel = 'Continue',
    this.onCancel,
    this.onAction,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(fy.spacing.lg),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: EdgeInsets.all(fy.spacing.xl),
        decoration: BoxDecoration(
          color: fy.colors.card,
          borderRadius: fy.shapes.borderRadiusLg,
          border: Border.all(color: fy.colors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ícone de Alerta Premium
            Container(
              padding: EdgeInsets.all(fy.spacing.md),
              decoration: BoxDecoration(
                color: isDestructive 
                    ? fy.colors.error.withOpacity(0.1) 
                    : fy.colors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isDestructive ? Icons.warning_amber_rounded : Icons.info_outline_rounded,
                color: isDestructive ? fy.colors.error : fy.colors.primary,
                size: 32,
              ),
            ),
            SizedBox(height: fy.spacing.lg),
            
            // Título
            Text(
              title,
              textAlign: TextAlign.center,
              style: fy.typography.h3.copyWith(
                color: fy.colors.cardForeground,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: fy.spacing.sm),
            
            // Descrição
            Text(
              description,
              textAlign: TextAlign.center,
              style: fy.typography.bodyMedium.copyWith(
                color: fy.colors.mutedForeground,
                height: 1.5,
              ),
            ),
            SizedBox(height: fy.spacing.xl),
            
            // Ações
            Row(
              children: [
                Expanded(
                  child: FyarnButton(
                    text: cancelLabel,
                    variant: FyarnButtonVariant.outline,
                    onPressed: () {
                      Navigator.pop(context);
                      onCancel?.call();
                    },
                  ),
                ),
                SizedBox(width: fy.spacing.md),
                Expanded(
                  child: FyarnButton(
                    text: actionLabel,
                    variant: isDestructive 
                        ? FyarnButtonVariant.destructive 
                        : FyarnButtonVariant.primary,
                    onPressed: () {
                      Navigator.pop(context);
                      onAction?.call();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



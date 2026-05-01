import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/tokens/tokens.dart';

class FyarnInputOTP extends StatelessWidget {
  final int length;
  final ValueChanged<String>? onCompleted;

  const FyarnInputOTP({
    super.key,
    this.length = 6,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final fy = context.fy;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return Container(
          width: 45,
          height: 55,
          margin: EdgeInsets.symmetric(horizontal: fy.spacing.xxs),
          decoration: BoxDecoration(
            color: fy.colors.input,
            borderRadius: BorderRadius.circular(fy.shapes.md),
            border: Border.all(color: fy.colors.border),
          ),
          child: Center(
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < length - 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}




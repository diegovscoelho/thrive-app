import 'package:flutter/material.dart';
import 'package:thrive/src/core/utils/app_styles.dart';

class CustomSecondaryButton extends StatelessWidget {
  const CustomSecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF0f0c29), width: 1.5),
          foregroundColor: const Color(0xFF0f0c29),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text, style: AppStyles.secondaryButtonStyle),
      ),
    );
  }
}

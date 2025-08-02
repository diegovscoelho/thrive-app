import 'package:flutter/material.dart';
import 'package:thrive/src/core/utils/app_styles.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
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
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0f0c29),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(text, style: AppStyles.primaryButtonStyle),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:thrive/src/core/utils/app_styles.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
  });

  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: const Color(0xFF707070),
          backgroundColor: backgroundColor ?? const Color(0xFF0f0c29),
          foregroundColor: textColor ?? Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.primaryButtonStyle(color: textColor),
        ),
      ),
    );
  }
}

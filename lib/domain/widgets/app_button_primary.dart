import 'package:flutter/material.dart';

class AppButtonPrimary extends StatelessWidget {
  const AppButtonPrimary({
    super.key,
    required this.labelText,
    this.textColor,
    this.backgroundColor,
    this.onTap,
    this.isLoading = false,
  });

  final String labelText;
  final Color? textColor;
  final Color? backgroundColor;
  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  labelText,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}

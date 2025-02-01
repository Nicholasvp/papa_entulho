import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButtonPrimary extends StatelessWidget {
  const AppButtonPrimary({
    super.key,
    required this.labelText,
    this.textColor,
    this.backgroundColor,
    this.onTap,
    this.isLoading = false,
    this.expanded = false,
    this.margin = 8.0,
  });

  final String labelText;
  final Color? textColor;
  final Color? backgroundColor;
  final Function()? onTap;
  final bool isLoading;
  final bool expanded;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: expanded ? double.infinity : null,
        padding: const EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(horizontal: margin),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator.adaptive()
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

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppButtonPrimary extends StatelessWidget {
  const AppButtonPrimary({
    super.key,
    required this.labelText,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
    this.isLoading = false,
    this.expanded = false,
    this.margin = 0.0,
  });

  final String labelText;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
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
        height: 50,
        padding: const EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(horizontal: margin),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: borderColor ?? Colors.white,
          ),
        ),
        child: Center(
          child: isLoading
              ? const LoadingIndicator(
                  indicatorType: Indicator.ballBeat,
                  colors: [Colors.white],
                )
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

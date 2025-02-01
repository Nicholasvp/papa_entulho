import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.required = false,
    this.numeric = false,
    this.icon,
    this.inputFormatters,
  });

  final String labelText;
  final TextEditingController controller;
  final String Function(String?)? validator;
  final bool required;
  final bool numeric;
  final IconData? icon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
      inputFormatters: [
        if (numeric) FilteringTextInputFormatter.digitsOnly,
        if (inputFormatters != null) ...inputFormatters!,
      ],
      validator: required ? (value) => value!.isEmpty ? 'Campo obrigatório' : null : validator,
      controller: controller,
    );
  }
}

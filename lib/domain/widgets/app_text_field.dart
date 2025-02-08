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
    this.onChanged,
  });

  final String labelText;
  final TextEditingController controller;
  final String Function(String?)? validator;
  final bool required;
  final bool numeric;
  final IconData? icon;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 16, color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        border: const OutlineInputBorder(),
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
      inputFormatters: [
        if (numeric) FilteringTextInputFormatter.digitsOnly,
        if (inputFormatters != null) ...inputFormatters!,
      ],
      validator: required ? (value) => value!.isEmpty ? 'Campo obrigatório' : null : validator,
      controller: controller,
      onChanged: onChanged,
    );
  }
}

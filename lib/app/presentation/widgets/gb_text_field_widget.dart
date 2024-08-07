import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GBTextFormField extends StatelessWidget {
  final int? maxLines;
  final int? maxLength;
  final double? height;
  final String labelText;
  final String? initialValue;
  final String? suffixText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const GBTextFormField({
    super.key,
    required this.labelText,
    this.initialValue,
    this.inputFormatters,
    this.controller,
    this.prefixIcon,
    this.obscureText,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.maxLines,
    this.maxLength, this.height, this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      validator: validator,
      textInputAction: textInputAction,
      onChanged: onChanged,
      initialValue: initialValue,
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        suffixText: suffixText,
        labelText: labelText,
        errorMaxLines: 1,
        errorStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        labelStyle: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

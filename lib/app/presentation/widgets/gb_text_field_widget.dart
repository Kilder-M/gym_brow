import 'package:flutter/material.dart';

class GBTextField extends StatelessWidget {
  final String labelText;

  const GBTextField({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        // controller: controller,
        // obscureText: obscureText,
        // keyboardType: keyboardType,
        // textInputAction: textInputAction,
        // onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 2),
          // prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            // borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

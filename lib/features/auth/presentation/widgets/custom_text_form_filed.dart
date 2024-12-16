import 'package:flutter/material.dart';
import 'package:note_app/features/auth/functions/build_outlined_input_border.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.onSaved,
    this.onChanged,
    required this.hint,
  });
  final String hint;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Filed is requrid";
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        border: buildOutlinedInputBorder(),
        enabledBorder: buildOutlinedInputBorder(),
      ),
    );
  }
}

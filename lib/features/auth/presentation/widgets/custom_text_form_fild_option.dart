import 'package:flutter/material.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_text_form_filed.dart';

class CustomTextFormFildOption extends StatelessWidget {
  const CustomTextFormFildOption({
    super.key,
    required this.title,
    required this.hint,
    this.onSaved,
    this.onChanged,
  });
  final String title;
  final String hint;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenHight * 0.01),
        CustomTextFormFiled(
          hint: hint,
          onSaved: onSaved,
          onChanged: onChanged,
        )
      ],
    );
  }
}

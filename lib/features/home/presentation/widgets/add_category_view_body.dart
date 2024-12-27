import 'package:flutter/material.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_text_form_filed.dart';

class AddCategoryViewBody extends StatefulWidget {
  const AddCategoryViewBody({super.key});

  @override
  State<AddCategoryViewBody> createState() => _AddCategoryViewBodyState();
}

class _AddCategoryViewBodyState extends State<AddCategoryViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CustomTextFormFiled(hint: "Enter Name"),
            const SizedBox(height: 16),
            CustomElevatedButton(
              buttonName: "Add",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

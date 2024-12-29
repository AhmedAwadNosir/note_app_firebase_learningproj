import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_text_form_filed.dart';
import 'package:note_app/features/home/data/models/category_modal.dart';
import 'package:note_app/features/home/states_manager/add_note_category/add_note_category_cubit.dart';

class AddCategoryViewBody extends StatefulWidget {
  const AddCategoryViewBody({super.key});

  @override
  State<AddCategoryViewBody> createState() => _AddCategoryViewBodyState();
}

class _AddCategoryViewBodyState extends State<AddCategoryViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String categoryName = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CustomTextFormFiled(
              hint: "Enter Name",
              onSaved: (value) {
                categoryName = value!;
              },
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              buttonName: "Add",
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  BlocProvider.of<AddNoteCategoryCubit>(context)
                      .AddNoteCategory(
                          catData: CategoryModal(
                              categoryName: categoryName,
                              userId: auth.currentUser!.uid));
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_text_form_filed.dart';
import 'package:note_app/features/home/data/models/note_modal.dart';
import 'package:note_app/features/home/states_manager/add_note/add_note_cubit.dart';

class AddNotesViewBody extends StatefulWidget {
  const AddNotesViewBody({super.key, required this.categoryId});
  final String categoryId;
  @override
  State<AddNotesViewBody> createState() => _AddCategoryViewBodyState();
}

class _AddCategoryViewBodyState extends State<AddNotesViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String note = "";
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
              hint: "Enter Note",
              onSaved: (value) {
                note = value!;
              },
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              buttonName: "Add",
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  BlocProvider.of<AddNoteCubit>(context).AddNote(
                      noteData: NoteModal(
                        note: note,
                      ),
                      categoryDocId: widget.categoryId);
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

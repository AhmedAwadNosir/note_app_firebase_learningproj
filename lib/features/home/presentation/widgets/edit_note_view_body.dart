import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_text_form_filed.dart';
import 'package:note_app/features/home/data/models/note_modal.dart';
import 'package:note_app/features/home/states_manager/add_note/add_note_cubit.dart';
import 'package:note_app/features/home/states_manager/edit_note/edit_note_cubit.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody(
      {super.key, required this.categoryId, required this.note});
  final String categoryId;
  final NoteModal note;

  @override
  State<EditNotesViewBody> createState() => _AddCategoryViewBodyState();
}

class _AddCategoryViewBodyState extends State<EditNotesViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String newNote = "";
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
              initialText: widget.note.note,
              hint: "Enter Note",
              onSaved: (value) {
                newNote = value!;
              },
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              buttonName: "Save",
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  BlocProvider.of<EditNoteCubit>(context).editNote(
                      parentDocId: widget.categoryId,
                      noteDocId: widget.note.docId!,
                      newData: NoteModal(note: newNote).tojson());
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

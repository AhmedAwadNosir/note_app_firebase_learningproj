import 'package:flutter/material.dart';

import 'package:note_app/features/home/data/models/note_modal.dart';
import 'package:note_app/features/home/presentation/widgets/edit_note_view_body_bloc_consumer.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView(
      {super.key, required this.categoryId, required this.note});
  static const id = "addnoteview";
  final String categoryId;

  final NoteModal note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
      ),
      body: EditNoteViewBodyBlocConsumer(categoryId: categoryId, note: note),
    );
  }
}

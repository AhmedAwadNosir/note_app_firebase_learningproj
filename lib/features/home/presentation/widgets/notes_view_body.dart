import 'package:flutter/material.dart';
import 'package:note_app/features/home/data/models/note_modal.dart';
import 'package:note_app/features/home/presentation/widgets/custom_note_card.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomNoteCard(noteModal: NoteModal(note: "Kill Your Self")),
          );
        },
      ),
    );
  }
}

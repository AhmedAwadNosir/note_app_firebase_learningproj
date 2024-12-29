import 'package:flutter/material.dart';
import 'package:note_app/features/home/data/models/note_modal.dart';
import 'package:note_app/features/home/presentation/widgets/custom_note_card_bloc_listener.dart';

class CustomNoteCard extends StatelessWidget {
  CustomNoteCard({
    super.key,
    required this.noteModal,
    required this.categoryDocId,
  });
  final NoteModal noteModal;
  final String categoryDocId;

  @override
  Widget build(BuildContext context) {
    return CustomNoteCardBlocListner(
        categoryDocId: categoryDocId, noteModal: noteModal);
  }
}

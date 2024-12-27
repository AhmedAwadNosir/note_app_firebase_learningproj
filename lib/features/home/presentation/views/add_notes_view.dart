import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/widgets/add_notes_view_body.dart';

class AddNotesView extends StatelessWidget {
  const AddNotesView({super.key});
  static const id = "addnoteview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: const AddNotesViewBody(),
    );
  }
}

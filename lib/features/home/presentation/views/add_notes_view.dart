import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/widgets/add_note_view_body_bloc_consumer.dart';

class AddNotesView extends StatelessWidget {
  const AddNotesView({super.key, required this.categoryId});
  static const id = "addnoteview";
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: AddNoteViewBodyBlocConsumer(categoryId: categoryId),
    );
  }
}

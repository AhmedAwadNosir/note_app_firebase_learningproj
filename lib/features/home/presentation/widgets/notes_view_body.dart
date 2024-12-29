import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/widgets/notes_list_view_builder_bloc_consumer.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key, required this.categoryDocId});
  final String categoryDocId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: NotesListViewBuilderBlockConsumer(
        categoryDocId: categoryDocId,
      ),
    );
  }
}

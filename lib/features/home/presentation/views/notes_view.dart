import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/presentation/views/add_notes_view.dart';
import 'package:note_app/features/home/presentation/widgets/notes_view_body.dart';
import 'package:note_app/features/home/states_manager/fetch_notes/fetch_notes_cubit.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key, required this.categoryId});

  final String categoryId;

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<FetchNotesCubit>(context)
        .fetchNotes(parendDocId: widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: NotesViewBody(
        categoryDocId: widget.categoryId,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddNotesView(categoryId: widget.categoryId),
              ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

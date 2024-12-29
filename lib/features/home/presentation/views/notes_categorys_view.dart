import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/presentation/views/add_category_view.dart';
import 'package:note_app/features/home/presentation/widgets/notes_category_view_body.dart';
import 'package:note_app/features/home/functions/sign_out.dart';
import 'package:note_app/features/home/states_manager/fetch_notes_categories/fetch_notes_categories_cubit.dart';

class NotesCategoriesView extends StatefulWidget {
  const NotesCategoriesView({super.key});
  static const id = "NotesCategoriesView";

  @override
  State<NotesCategoriesView> createState() => _NotesCategoriesViewState();
}

class _NotesCategoriesViewState extends State<NotesCategoriesView> {
  @override
  void initState() {
    BlocProvider.of<FetchNotesCategoriesCubit>(context).fetchNotesCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                signOut(context: context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const NotesCategoryViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddCategoryView.id);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

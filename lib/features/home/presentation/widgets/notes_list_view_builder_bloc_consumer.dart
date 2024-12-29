import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/home/data/models/note_modal.dart';
import 'package:note_app/features/home/presentation/widgets/custom_note_card.dart';
import 'package:note_app/features/home/presentation/widgets/no_notes_found.dart';
import 'package:note_app/features/home/states_manager/fetch_notes/fetch_notes_cubit.dart';

class NotesListViewBuilderBlockConsumer extends StatelessWidget {
  const NotesListViewBuilderBlockConsumer({
    super.key,
    required this.categoryDocId,
  });
  final String categoryDocId;
  @override
  Widget build(BuildContext context) {
    List<NoteModal> notes = [];
    return BlocConsumer<FetchNotesCubit, FetchNotesState>(
      listener: (context, state) {
        if (state is FetchNotesFailure) {
          showAwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              dialogTitle: "Error",
              dialogDesc:
                  "Check Your internet Conection! ${state.errorMessage}");
        }
        if (state is FetchNotesSuccess) {
          notes = state.notes;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is FetchNotesLoading,
          child: notes.isEmpty
              ? const NoNotesFound()
              : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomNoteCard(
                        noteModal: notes[index],
                        categoryDocId: categoryDocId,
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}

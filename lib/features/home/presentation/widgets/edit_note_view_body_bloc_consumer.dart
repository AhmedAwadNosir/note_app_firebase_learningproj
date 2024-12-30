import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/home/data/models/note_modal.dart';
import 'package:note_app/features/home/presentation/widgets/edit_note_view_body.dart';
import 'package:note_app/features/home/states_manager/edit_note/edit_note_cubit.dart';
import 'package:note_app/features/home/states_manager/fetch_notes/fetch_notes_cubit.dart';

class EditNoteViewBodyBlocConsumer extends StatelessWidget {
  const EditNoteViewBodyBlocConsumer({
    super.key,
    required this.categoryId,
    required this.note,
  });

  final String categoryId;
  final NoteModal note;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditNoteCubit, EditNoteState>(
      listener: (context, state) {
        if (state is EditNoteFailure) {
          showAwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              dialogTitle: "Error",
              dialogDesc:
                  "Check Your internet Conection! ${state.errorMessage}");
        }
        if (state is EditNoteSuccess) {
          BlocProvider.of<FetchNotesCubit>(context)
              .fetchNotes(parendDocId: categoryId);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is EditNoteLoading,
            child: EditNotesViewBody(categoryId: categoryId, note: note));
      },
    );
  }
}

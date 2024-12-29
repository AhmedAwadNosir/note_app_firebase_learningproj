import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/home/presentation/widgets/add_notes_view_body.dart';
import 'package:note_app/features/home/states_manager/add_note/add_note_cubit.dart';
import 'package:note_app/features/home/states_manager/fetch_notes/fetch_notes_cubit.dart';

class AddNoteViewBodyBlocConsumer extends StatelessWidget {
  const AddNoteViewBodyBlocConsumer({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          showAwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              dialogTitle: "Error",
              dialogDesc:
                  "Check Your internet Conection! ${state.errorMessage}");
        }
        if (state is AddNoteSuccess) {
          BlocProvider.of<FetchNotesCubit>(context)
              .fetchNotes(parendDocId: categoryId);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading,
            child: AddNotesViewBody(
              categoryId: categoryId,
            ));
      },
    );
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/home/data/models/note_modal.dart';
import 'package:note_app/features/home/presentation/views/edit_note_view.dart';
import 'package:note_app/features/home/states_manager/dellete_note/dellete_note_cubit.dart';
import 'package:note_app/features/home/states_manager/fetch_notes/fetch_notes_cubit.dart';

class CustomNoteCardBlocListner extends StatelessWidget {
  const CustomNoteCardBlocListner({
    super.key,
    required this.categoryDocId,
    required this.noteModal,
  });

  final String categoryDocId;
  final NoteModal noteModal;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DelleteNoteCubit, DelleteNoteState>(
      listener: (context, state) {
        if (state is DelleteNoteFailure) {
          showAwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              dialogTitle: "Error",
              dialogDesc:
                  "Check Your internet Conection! ${state.errorMessage}");
        }
        if (state is DelleteNoteSuccess) {
          BlocProvider.of<FetchNotesCubit>(context)
              .fetchNotes(parendDocId: categoryDocId);
        }
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditNotesView(
                  categoryId: categoryDocId,
                  note: noteModal,
                ),
              ));
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          noteModal.note,
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                      onTap: () {
                        showAwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          dialogTitle: '',
                          dialogDesc: "do you want to delete this Category",
                          btnOkColor: Colors.red,
                          btnOkName: "Dellete",
                          btnCancelColor: Colors.green,
                          btnOkOnPress: () {
                            BlocProvider.of<DelleteNoteCubit>(context)
                                .delleteNote(
                                    docId: noteModal.docId!,
                                    parendDocId: categoryDocId);
                          },
                          btnCancelOnPress: () {},
                        );
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 35,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

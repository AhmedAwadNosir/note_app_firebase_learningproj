import 'package:flutter/material.dart';
import 'package:note_app/features/home/data/models/note_modal.dart';

class CustomNoteCard extends StatelessWidget {
  CustomNoteCard(
      {super.key, required this.noteModal, this.deletOptionDisapled});
  final NoteModal noteModal;
  bool? deletOptionDisapled;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              deletOptionDisapled == null
                  ? GestureDetector(
                      onTap: () {
                        // showConfermaTionDailog(
                        //   context,
                        //   dailogTitle:
                        //       "Are your sure you want dellete this note ?",
                        //   cancelButtonName: "Cancel",
                        //   confirmButtonName: "Dellete",
                        //   confirmOnPressed: () {
                        //     noteModal.delete();
                        //     BlocProvider.of<GetNotesCubit>(context).getNotes();
                        //     Navigator.pop(context);
                        //   },
                        // );
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 35,
                      ))
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

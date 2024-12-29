import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/services/firebase_servieces.dart';
import 'package:note_app/core/utils/app_constants.dart';
import 'package:note_app/features/home/data/models/note_modal.dart';

part 'fetch_notes_state.dart';

class FetchNotesCubit extends Cubit<FetchNotesState> {
  FetchNotesCubit() : super(FetchNotesInitial());

  Future<void> fetchNotes({required String parendDocId}) async {
    final FirebaseServieces firebaseServieces = FirebaseServieces();
    emit(FetchNotesLoading());
    try {
      QuerySnapshot snapshot = await firebaseServieces.getSubColectionDocs(
        colecName: AppConstants.notesCategorycolName,
        docId: parendDocId,
        subColecName: AppConstants.notescolName,
      );
      final List<NoteModal> notes = [];
      for (var doc in snapshot.docs) {
        NoteModal noteModal;
        noteModal = NoteModal.fromJson(doc.data());
        noteModal.docId = doc.id;
        notes.add(noteModal);
      }
      emit(FetchNotesSuccess(notes: notes));
    } catch (e) {
      emit(FetchNotesFailure(errorMessage: e.toString()));
    }
  }
}

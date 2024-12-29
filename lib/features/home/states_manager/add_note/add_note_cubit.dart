import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/services/firebase_servieces.dart';
import 'package:note_app/core/utils/app_constants.dart';
import 'package:note_app/features/home/data/models/note_modal.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Future<void> AddNote(
      {required NoteModal noteData, required String categoryDocId}) async {
    final FirebaseServieces firebaseServieces = FirebaseServieces();
    emit(AddNoteLoading());
    try {
      await firebaseServieces.addSubColectionDoc(
        colecName: AppConstants.notesCategorycolName,
        docId: categoryDocId,
        subColecName: AppConstants.notescolName,
        data: noteData.tojson(),
      );
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errorMessage: e.toString()));
    }
  }
}

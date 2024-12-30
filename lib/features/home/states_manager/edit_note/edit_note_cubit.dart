import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/services/firebase_servieces.dart';
import 'package:note_app/core/utils/app_constants.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  Future<void> editNote(
      {required String parentDocId,
      required String noteDocId,
      required Map<String, dynamic> newData}) async {
    final FirebaseServieces firebaseServieces = FirebaseServieces();
    emit(EditNoteLoading());
    try {
      await firebaseServieces.updateSubColectDoc(
          colecName: AppConstants.notesCategorycolName,
          data: newData,
          docId: parentDocId,
          subColecName: AppConstants.notescolName,
          subColecdocId: noteDocId);
      emit(EditNoteSuccess());
    } catch (e) {
      emit(EditNoteFailure(errorMessage: e.toString()));
    }
  }
}

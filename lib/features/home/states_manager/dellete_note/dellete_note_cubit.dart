import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/services/firebase_servieces.dart';
import 'package:note_app/core/utils/app_constants.dart';

part 'dellete_note_state.dart';

class DelleteNoteCubit extends Cubit<DelleteNoteState> {
  DelleteNoteCubit() : super(DelleteNoteInitial());

  Future<void> delleteNote(
      {required String docId, required String parendDocId}) async {
    emit(DelleteNoteLoading());
    final FirebaseServieces firebaseServieces = FirebaseServieces();
    try {
      await firebaseServieces.deleteSubColectionDoc(
          colecName: AppConstants.notesCategorycolName,
          docId: parendDocId,
          subColecName: AppConstants.notescolName,
          subColecdocId: docId);
      emit(DelleteNoteSuccess());
    } catch (e) {
      emit(DelleteNoteFailure(errorMessage: e.toString()));
    }
  }
}

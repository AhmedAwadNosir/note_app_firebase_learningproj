import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/services/firebase_servieces.dart';
import 'package:note_app/core/utils/app_constants.dart';

part 'dellete_note_category_state.dart';

class DelleteNoteCategoryCubit extends Cubit<DelleteNoteCategoryState> {
  DelleteNoteCategoryCubit() : super(DelleteNoteCategroyInitial());
  Future<void> delleteCategory({required String docId}) async {
    emit(DelleteNoteCategroyLoading());
    final FirebaseServieces firebaseServieces = FirebaseServieces();
    try {
      await firebaseServieces.deleteDoc(
          colecName: AppConstants.notesCategorycolName, docId: docId);
      emit(DelleteNoteCategroySuccess());
    } catch (e) {
      emit(DelleteNoteCategroyFailure(errorMessage: e.toString()));
    }
  }
}

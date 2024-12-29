import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/services/firebase_servieces.dart';
import 'package:note_app/core/utils/app_constants.dart';
import 'package:note_app/features/home/data/models/category_modal.dart';

part 'add_note_category_state.dart';

class AddNoteCategoryCubit extends Cubit<AddNoteCategoryState> {
  AddNoteCategoryCubit() : super(AddNoteCategoryInitial());

  Future<void> AddNoteCategory({required CategoryModal catData}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseServieces firebaseServieces = FirebaseServieces();
    emit(AddNoteCategoryLoading());
    try {
      await firebaseServieces.addDocwithId(
          colecName: AppConstants.notesCategorycolName,
          data: catData.tojson(),
          setOptionMerged: false);
      emit(AddNoteCategorySuccess());
    } catch (e) {
      emit(AddNoteCategoryFailure(errorMessage: e.toString()));
    }
  }
}

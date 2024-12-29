import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/services/firebase_servieces.dart';
import 'package:note_app/core/utils/app_constants.dart';
import 'package:note_app/features/home/data/models/category_modal.dart';

part 'fetch_notes_categories_state.dart';

class FetchNotesCategoriesCubit extends Cubit<FetchNotesCategoriesState> {
  FetchNotesCategoriesCubit() : super(FetchNotesCategoriesInitial());
  Future<void> fetchNotesCategories() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseServieces firebaseServieces = FirebaseServieces();
    emit(FetchNotesCategoriesLoading());
    try {
      QuerySnapshot snapshot =
          await firebaseServieces.getDocsWhereFiledEqualValue(
              colecName: AppConstants.notesCategorycolName,
              filed: "userId",
              value: auth.currentUser!.uid);
      final List<CategoryModal> categories = [];
      for (var doc in snapshot.docs) {
        CategoryModal categoryModal;
        categoryModal = CategoryModal.fromJson(doc.data());
        categoryModal.docId = doc.id;
        log(categoryModal.docId.toString());
        categories.add(categoryModal);
      }
      emit(FetchNotesCategoriesSuccess(categories: categories));
    } catch (e) {
      emit(FetchNotesCategoriesFailure(errorMessage: e.toString()));
    }
  }
}

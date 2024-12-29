part of 'fetch_notes_categories_cubit.dart';

@immutable
sealed class FetchNotesCategoriesState {}

final class FetchNotesCategoriesInitial extends FetchNotesCategoriesState {}

final class FetchNotesCategoriesLoading extends FetchNotesCategoriesState {}

final class FetchNotesCategoriesSuccess extends FetchNotesCategoriesState {
  final List<CategoryModal> categories;

  FetchNotesCategoriesSuccess({required this.categories});
}

final class FetchNotesCategoriesFailure extends FetchNotesCategoriesState {
  final String errorMessage;

  FetchNotesCategoriesFailure({required this.errorMessage});
}

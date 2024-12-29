part of 'add_note_category_cubit.dart';

@immutable
sealed class AddNoteCategoryState {}

final class AddNoteCategoryInitial extends AddNoteCategoryState {}

final class AddNoteCategoryLoading extends AddNoteCategoryState {}

final class AddNoteCategorySuccess extends AddNoteCategoryState {}

final class AddNoteCategoryFailure extends AddNoteCategoryState {
  final String errorMessage;

  AddNoteCategoryFailure({required this.errorMessage});
}

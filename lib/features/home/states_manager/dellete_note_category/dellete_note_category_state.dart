part of 'dellete_note-category_cubit.dart';

@immutable
sealed class DelleteNoteCategoryState {}

final class DelleteNoteCategroyInitial extends DelleteNoteCategoryState {}

final class DelleteNoteCategroyLoading extends DelleteNoteCategoryState {}

final class DelleteNoteCategroySuccess extends DelleteNoteCategoryState {}

final class DelleteNoteCategroyFailure extends DelleteNoteCategoryState {
  final String errorMessage;

  DelleteNoteCategroyFailure({required this.errorMessage});
}

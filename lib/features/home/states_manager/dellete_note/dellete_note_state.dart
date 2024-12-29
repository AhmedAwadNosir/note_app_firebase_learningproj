part of 'dellete_note_cubit.dart';

@immutable
sealed class DelleteNoteState {}

final class DelleteNoteInitial extends DelleteNoteState {}

final class DelleteNoteLoading extends DelleteNoteState {}

final class DelleteNoteSuccess extends DelleteNoteState {}

final class DelleteNoteFailure extends DelleteNoteState {
  final String errorMessage;

  DelleteNoteFailure({required this.errorMessage});
}

part of 'fetch_notes_cubit.dart';

@immutable
sealed class FetchNotesState {}

final class FetchNotesInitial extends FetchNotesState {}

final class FetchNotesLoading extends FetchNotesState {}

final class FetchNotesSuccess extends FetchNotesState {
  final List<NoteModal> notes;

  FetchNotesSuccess({required this.notes});
}

final class FetchNotesFailure extends FetchNotesState {
  final String errorMessage;

  FetchNotesFailure({required this.errorMessage});
}

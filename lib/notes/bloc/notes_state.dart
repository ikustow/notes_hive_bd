part of 'notes_bloc.dart';

abstract class NotesState extends Equatable {
  const NotesState();
}

class NotesInitial extends NotesState {
  @override
  List<Object> get props => [];
}

class NotesLoadedState extends NotesState {
  final List<Note> notes;
  final String username;

  const NotesLoadedState(
      this.notes,
      this.username,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
    notes,
    username,
  ];
}
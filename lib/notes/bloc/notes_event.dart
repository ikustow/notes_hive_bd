part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();
}

class LoadNotesEvent extends NotesEvent {
  final String username;

  LoadNotesEvent(this.username);
  @override
  // TODO: implement props
  List<Object?> get props => [username];

}

class AddNoteEvent extends NotesEvent {
  final List noteResult;


  AddNoteEvent(this.noteResult);

  @override
  // TODO: implement props
  List<Object?> get props => [noteResult];
}



class UpdateNoteEvent extends NotesEvent {
  final List noteResult;


  UpdateNoteEvent(this.noteResult);

  @override
  // TODO: implement props
  List<Object?> get props => [noteResult];
}


class RemoveNoteEvent extends NotesEvent {
  final List noteResult;


  RemoveNoteEvent(this.noteResult);

  @override
  // TODO: implement props
  List<Object?> get props => [noteResult];
}


class ToggleNoteEvent extends NotesEvent {
  final String noteTask;

  ToggleNoteEvent(this.noteTask);
  @override
  // TODO: implement props
  List<Object?> get props => [noteTask];
}
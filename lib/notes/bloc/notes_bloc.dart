import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_hive_bd/model/note.dart';
import 'package:notes_hive_bd/services/notes.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NoteService _noteService;

  NotesBloc(this._noteService) : super(NotesInitial()) {
    on<LoadNotesEvent>((event, emit) {
      final notes = _noteService.getAllNotes(event.username);
      emit(NotesLoadedState(notes,event.username ));
    });

    on<AddNoteEvent>((event, emit) async {
      final currentState = state as NotesLoadedState;
      _noteService.addTask(event.noteResult, currentState.username);
      add(LoadNotesEvent(currentState.username));
    });



    on<UpdateNoteEvent>((event, emit) async {
      final currentState = state as NotesLoadedState;
      _noteService.updateCurrentTask(event.noteResult, currentState.username);
      add(LoadNotesEvent(currentState.username));
    });

    on<RemoveNoteEvent>((event, emit) async {
      final currentState = state as NotesLoadedState;
      _noteService.removeTask(event.noteResult, currentState.username);
      add(LoadNotesEvent(currentState.username));
    });


    on<ToggleNoteEvent>((event, emit) async {
      final currentState = state as NotesLoadedState;
      await _noteService.updateTask(event.noteTask, currentState.username);
      add(LoadNotesEvent(currentState.username));
    });
  }
}

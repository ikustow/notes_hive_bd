import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:notes_hive_bd/model/note.dart';

class NoteService {
  late Box<Note> _notes;

  Future<void> init() async {
    Hive.registerAdapter(NoteAdapter());
    _notes = await Hive.openBox<Note>('notes');

    final notes =
    _notes.values.where((element) => element.username == 'Demo');

    for (var note in notes) {
      note.delete();
    }
    // just for example
    generateDemoData();


  }

  List<Note> getAllNotes(final String username) {
    final notes =
        _notes.values.where((element) => element.username == username);
    return notes.toList();
  }

  void addTask(final List noteResult, final String username) {
    DateTime now = DateTime.now();
    var date = now.toString();
    _notes.add(Note(1, noteResult[0].toString(), noteResult[1].toString(),
        false, noteResult.elementAt(2), date, 1, username));
  }

  Future<void> removeTask(final List note, final String username) async {
    final taskToRemove = _notes.values.firstWhere(
        (element) => element.key == note[0] && element.username == username);
    await taskToRemove.delete();
  }

  Future<void> updateTask(final String note, final String username) async {
    final taskToEdit = _notes.values.firstWhere(
        (element) => element.title == note && element.username == username);
    final index = taskToEdit.key as int;
    await _notes.put(
        index,
        Note(
            taskToEdit.key,
            taskToEdit.title,
            taskToEdit.note,
            !taskToEdit.completed,
            taskToEdit.color,
            taskToEdit.date,
            1,
            username));
  }

  Future<void> updateCurrentTask(final List note, final String username) async {
    final taskToEdit = _notes.values.firstWhere(
        (element) => element.key == note[0] && element.username == username);
    final index = taskToEdit.key as int;

    await _notes.put(
        index,
        Note(
            taskToEdit.key,
            note[1].toString(),
            note[2].toString(),
            taskToEdit.completed,
            note[3].toString(),
            taskToEdit.date,
            1,
            username));
  }

  Future<void> generateDemoData() async {



    final String backgroundColorG = const Color.fromRGBO(129, 222, 163, 1).toString();
    String valueStringG = backgroundColorG.split('(0x')[1].split(')')[0];

    final String backgroundColorP = const Color.fromRGBO(204, 179, 255, 1).toString();
    String valueStringP = backgroundColorP.split('(0x')[1].split(')')[0];

    final String backgroundColorPink = const Color.fromRGBO(255, 179, 179, 1).toString();
    String valueStringPink = backgroundColorPink.split('(0x')[1].split(')')[0];



    DateTime now = DateTime.now();
    var date = now.toString();
    _notes.add(Note(1, 'Title 1', "Demo Description", false, valueStringG,
        date, 1, 'Demo'));

    _notes.add(Note(1, 'Title 2', "Demo long Description with many words", false, valueStringP,
        date, 1, 'Demo'));

    _notes.add(Note(1, 'Title 3', "Demo Description", false, valueStringG,
        date, 1, 'Demo'));

    _notes.add(Note(1, 'Title 4', "Demo long Description with many words", false, valueStringP,
        date, 1, 'Demo'));

    _notes.add(Note(1, 'Title 5', "Demo Description", true, valueStringPink,
        date, 1, 'Demo'));

    _notes.add(Note(1, 'Title 6', "Demo long Description with many words", false, valueStringP,
        date, 1, 'Demo'));

    _notes.add(Note(1, 'Title 7', "Demo long Description with many words", false, valueStringPink,
        date, 1, 'Demo'));

    _notes.add(Note(1, 'Title 8', "Demo long Description with many words", false, valueStringG,
        date, 1, 'Demo'));
  }

}

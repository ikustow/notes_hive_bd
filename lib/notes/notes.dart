import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_hive_bd/generated/l10n.dart';
import 'package:notes_hive_bd/notes/widgets/favorite_notes_widget.dart';
import 'package:notes_hive_bd/notes/widgets/new_task_widget.dart';
import 'package:notes_hive_bd/notes/widgets/grid_notes_widget.dart';
import 'package:notes_hive_bd/services/notes.dart';
import 'bloc/notes_bloc.dart';

class NotesPage extends StatelessWidget {
  final String username;

  const NotesPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notes_appbar_title),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                NotesBloc(RepositoryProvider.of<NoteService>(context))
                  ..add(LoadNotesEvent(username)),
          ),
          // BlocProvider(
          //   create: (context) => SubjectBloc(),
          // ),
        ],
        child: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            if (state is NotesLoadedState) {
              final _favorintesNotes =
                  state.notes.where((element) => element.completed == true);
              final _allNotes =
                  state.notes.where((element) => element.completed == false);

              return SingleChildScrollView(
                child: Column(
                  children: [
                     Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          S.of(context).notes_favorites_title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    FavoriteNotesWidget(notesList: _favorintesNotes.toList()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                             S.of(context).notes_all_notes_title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(16, 32),
                                primary: Colors.deepPurple,
                              ),
                              onPressed: () async {
                                final result = await showDialog<List>(
                                    context: context,
                                    builder: (context) => Dialog(
                                          child: CreateNewTask(),
                                        ));
                                if (result != null) {
                                  BlocProvider.of<NotesBloc>(context)
                                      .add(AddNoteEvent(result));
                                }
                              },
                              child: const Icon(Icons.add)),
                        ],
                      ),
                    ),
                    NotesWidget(
                      notesList: _allNotes.toList(),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

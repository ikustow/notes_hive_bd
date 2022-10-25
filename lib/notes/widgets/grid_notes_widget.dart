import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_hive_bd/notes/bloc/notes_bloc.dart';
import 'package:notes_hive_bd/notes/widgets/current_task_widget.dart';

class NotesWidget extends StatefulWidget {
  final List notesList;

  const NotesWidget({Key? key, required this.notesList}) : super(key: key);

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  @override
  Widget build(BuildContext context) {

    final notes = widget.notesList;

    Icon outlinedIcon = const Icon(Icons.favorite_border_outlined);
    Icon filledIcon = const Icon(Icons.favorite);

    colorValueParse(stringValue) {
      int value = int.parse(stringValue, radix: 16);
      Color otherColor = Color(value);
      return otherColor;
    }

    return MasonryGridView.count(
      physics: const NeverScrollableScrollPhysics(),
      addAutomaticKeepAlives: true,

      shrinkWrap: true,
      itemCount: notes.length,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      // the number of columns
      crossAxisCount: 2,
      // vertical gap between two items
      mainAxisSpacing: 4,
      // horizontal gap between two items
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {

        // display each item with a card
        return GestureDetector(
          onTap: () async {
            final result = await showDialog<List>(
                context: context,
                builder: (context) => Dialog(
                      child: CurrentTaskWidget(
                        id: notes[index].key,
                        description: notes[index].note,
                        title: notes[index].title,
                      ),
                    ));
            if (result != null) {
              if (result[4] == 1) {
                BlocProvider.of<NotesBloc>(context)
                    .add(UpdateNoteEvent(result));
              } else if (result[4] == 0) {
                BlocProvider.of<NotesBloc>(context)
                    .add(UpdateNoteEvent(result));
              }
            }
          },
          child: Card(
            color: colorValueParse(notes[index].color),
            key: ValueKey(notes[index].key),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      notes[index].date.substring(0, 10),
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 36,
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<NotesBloc>(context)
                            .add(ToggleNoteEvent(notes[index].title));
                      },
                      icon: (notes[index].completed == true)
                          ? filledIcon
                          : outlinedIcon,
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      notes[index].title,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      notes[index].note,
                      maxLines: 6,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                //Text((notes[index].note)),
              ],
            ),
          ),
        );
      },
    );
  }
}

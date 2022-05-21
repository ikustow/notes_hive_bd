import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_hive_bd/notes/bloc/notes_bloc.dart';

class FavoriteNotesWidget extends StatefulWidget {
  final List notesList;
  const FavoriteNotesWidget({Key? key, required this.notesList}) : super(key: key);

  @override
  State<FavoriteNotesWidget> createState() => _FavoriteNotesWidgetState();
}

class _FavoriteNotesWidgetState extends State<FavoriteNotesWidget> {
  @override
  Widget build(BuildContext context) {

    final notes = widget.notesList;

    Icon outlinedIcon = Icon(Icons.favorite_border_outlined);
    Icon filledIcon = Icon(Icons.favorite);


    colorValueParse(SringValue) {
      int value = int.parse(SringValue, radix: 16);
      Color otherColor = new Color(value);
      return otherColor;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      child: AlignedGridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: notes.length,
        itemBuilder: (context, index) {

          return Card(
            color: colorValueParse(notes[index].color),
            key: ValueKey(notes[index].key),
            child: Column(

              children: [

                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 16,),
                    Text(
                      notes[index].date.substring(0, 10),
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(width: 48,),
                    IconButton(onPressed: (){
                      BlocProvider.of<NotesBloc>(context).add(ToggleNoteEvent(notes[index].title));
                    }, icon: (notes[index].completed == true)
                        ? filledIcon
                        : outlinedIcon,)
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      notes[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      notes[index].note,
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                //Text((notes[index].note)),
              ],
            ),
          );
        },
      ),
    );
  }
}

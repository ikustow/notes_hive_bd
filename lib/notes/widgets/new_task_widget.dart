import 'package:flutter/material.dart';
import 'package:notes_hive_bd/generated/l10n.dart';
import 'package:notes_hive_bd/notes/theme.dart';

class CreateNewTask extends StatefulWidget {
  CreateNewTask({Key? key}) : super(key: key);

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  final _inputTitleController = TextEditingController();
  final _inputDescriptionController = TextEditingController();

  Color _colorValue = defaultBackgroundColor;
  BorderSide pressedBorders = pressedBordersStyle;
  BorderSide unpressedBorders = unpressedBordersStyle;

  int button_no_1 = 1;
  int button_no_2 = 2;
  int button_no_3 = 3;
  int button_no_4 = 4;

  int currentButton = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 56,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(color: boxDecorationColor),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).detail_notes_title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            controller: _inputTitleController,
            minLines: 1,
            maxLines: 2,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: S.of(context).detail_notes_hint_name,
              hintStyle: TextStyle(color: hintColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).detail_notes_note,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: TextFormField(
            controller: _inputDescriptionController,
            minLines: 10,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: S.of(context).detail_notes_hint_note,
              hintStyle: TextStyle(color: hintColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).detail_notes_color_picker_title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: (currentButton == button_no_1)
                    ? pressedBorders
                    : unpressedBorders,
                primary:  greenBackgroundColor,
              ),
              onPressed: () {
                setState(() {
                  _colorValue =  greenBackgroundColor;
                  currentButton = button_no_1;
                });
              },
              child: Text(''),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: (currentButton == button_no_2)
                    ? pressedBorders
                    : unpressedBorders,
                primary: purpleBackgroundColor,
              ),
              onPressed: () {
                setState(() {
                  _colorValue = purpleBackgroundColor;
                  currentButton = button_no_2;
                });
              },
              child: Text(''),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: (currentButton == button_no_3)
                    ? pressedBorders
                    : unpressedBorders,
                primary: pinkBackgroundColor,
              ),
              onPressed: () {
                setState(() {
                  _colorValue = pinkBackgroundColor;
                  currentButton = button_no_3;
                });
              },
              child: Text(''),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: (currentButton == button_no_4)
                    ? pressedBorders
                    : unpressedBorders,
                primary: yellowBackgroundColor,
              ),
              onPressed: () {
                setState(() {
                  _colorValue = yellowBackgroundColor;
                  currentButton = button_no_4;
                });
              },
              child: Text(''),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
              onPressed: () {
                final String backgroundColor = _colorValue.toString();
                String valueStringC = backgroundColor.split('(0x')[1].split(')')[0];
                final List result = [
                  _inputTitleController.text,
                  _inputDescriptionController.text,
                  valueStringC,
                ];
                Navigator.of(context).pop(result);
              },
              child: Text(S.of(context).detail_notes_save_button_title)),
        )
      ],
    );
  }
}

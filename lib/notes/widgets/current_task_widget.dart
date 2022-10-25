import 'package:flutter/material.dart';
import 'package:notes_hive_bd/generated/l10n.dart';
import 'package:notes_hive_bd/notes/theme.dart';

class CurrentTaskWidget extends StatefulWidget {
  final String title;
  final String description;
  final int id;

  const CurrentTaskWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.id})
      : super(key: key);

  @override
  State<CurrentTaskWidget> createState() => _CurrentTaskWidgetState();
}

class _CurrentTaskWidgetState extends State<CurrentTaskWidget> {
  final _inputTitleController = TextEditingController();
  final _inputDescriptionController = TextEditingController();

  Color _colorValue = defaultBackgroundColor;
  BorderSide pressedBorders = pressedBordersStyle;
  BorderSide unpressedBorders = unpressedBordersStyle;

  int buttonNo1 = 1;
  int buttonNo2 = 2;
  int buttonNo3 = 3;
  int buttonNo5 = 4;

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).detail_notes_title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            controller: _inputTitleController,
            minLines: 1,
            maxLines: 2,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: widget.title,
              hintStyle: const TextStyle(color: hintColor),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).detail_notes_note,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: TextFormField(
            controller: _inputDescriptionController,
            minLines: 10,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: widget.description,
              hintStyle: const TextStyle(color: hintColor),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).detail_notes_color_picker_title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: (currentButton == buttonNo1)
                    ? pressedBorders
                    : unpressedBorders,
                primary: greenBackgroundColor,
              ),
              onPressed: () {
                setState(() {
                  _colorValue = greenBackgroundColor;
                  currentButton = buttonNo1;
                });
              },
              child: const Text(''),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: (currentButton == buttonNo2)
                    ? pressedBorders
                    : unpressedBorders,
                primary: purpleBackgroundColor,
              ),
              onPressed: () {
                setState(() {
                  _colorValue = purpleBackgroundColor;
                  currentButton = buttonNo2;
                });
              },
              child: const Text(''),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: (currentButton == buttonNo3)
                    ? pressedBorders
                    : unpressedBorders,
                primary: pinkBackgroundColor,
              ),
              onPressed: () {
                setState(() {
                  _colorValue = pinkBackgroundColor;
                  currentButton = buttonNo3;
                });
              },
              child: const Text(''),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: (currentButton == buttonNo5)
                    ? pressedBorders
                    : unpressedBorders,
                primary: yellowBackgroundColor,
              ),
              onPressed: () {
                setState(() {
                  _colorValue = yellowBackgroundColor;
                  currentButton = buttonNo5;
                });
              },
              child: const Text(''),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                final key = widget.id;

                final String _titleNew =
                    (_inputTitleController.text.isEmpty)
                        ? widget.title
                        : _inputTitleController.text;

                final String _descNew =
                    (_inputDescriptionController.text.isEmpty)
                        ? widget.description
                        : _inputDescriptionController.text ;

                final String backgroundColor = _colorValue.toString();
                String valueStringC =
                    backgroundColor.split('(0x')[1].split(')')[0];
                final List result = [
                  key,
                  _titleNew,
                  _descNew,
                  valueStringC,
                  1
                ];
                Navigator.of(context).pop(result);
              },
              child: Text(S.of(context).detail_notes_save_button_title)),
        ),
        ElevatedButton(
            style: deleteButtonStyle,
            onPressed: () {
              final key = widget.id;

              final List result = [
                key,
                '',
                '',
                '',
                0
              ];
              Navigator.of(context).pop(result);
            },
            child: Text(S.of(context).detail_notes_delete_button_title))
      ],
    );
  }
}




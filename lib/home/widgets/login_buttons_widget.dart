import 'package:flutter/material.dart';
import 'package:notes_hive_bd/generated/l10n.dart';

class DividersRow extends StatelessWidget {
  const DividersRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children:  <Widget>[
      const Expanded(
          child: Divider(
        indent: 24.0,
        endIndent: 10.0,
        thickness: 1,
        color: Colors.black,
      )),
      Text(
        S.of(context).home_or_title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      const Expanded(
          child: Divider(
        color: Colors.black,
        indent: 10,
        endIndent: 24.0,
        thickness: 1,
      )),
    ]);
  }
}

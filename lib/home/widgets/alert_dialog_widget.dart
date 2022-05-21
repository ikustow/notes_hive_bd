import 'package:flutter/material.dart';
import 'package:notes_hive_bd/generated/l10n.dart';

class alertDialogSwidget extends StatelessWidget {
  final String errorMessage;
  const alertDialogSwidget({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).home_alert_message),
      content: Text(errorMessage),
    );
  }
}
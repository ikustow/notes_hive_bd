import 'package:flutter/material.dart';
import 'package:notes_hive_bd/generated/l10n.dart';

class InputsFieldWidget extends StatefulWidget {
  final TextEditingController usernameField;
  final TextEditingController passwordField;


  const InputsFieldWidget({Key? key, required this.usernameField, required this.passwordField}) : super(key: key);

  @override
  State<InputsFieldWidget> createState() => _InputsFieldWidgetState();
}

class _InputsFieldWidgetState extends State<InputsFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 4),
        child: TextField(
          controller: widget.usernameField,
          decoration: InputDecoration(labelText: S.of(context).home_username_initial),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 4),
        child: TextField(
          controller: widget.passwordField,
          obscureText: true,
          decoration: InputDecoration(labelText: S.of(context).home_password_initial),
        ),
      ),
    ],);
  }
}

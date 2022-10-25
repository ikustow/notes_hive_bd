import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_hive_bd/generated/l10n.dart';
import 'package:notes_hive_bd/home/bloc/home_bloc.dart';
import 'package:notes_hive_bd/home/widgets/alert_dialog_widget.dart';
import 'package:notes_hive_bd/home/widgets/inputs_field_widget.dart';
import 'package:notes_hive_bd/home/widgets/login_buttons_widget.dart';
import 'package:notes_hive_bd/notes/notes.dart';
import 'package:notes_hive_bd/services/authentication.dart';
import 'package:notes_hive_bd/services/notes.dart';

class HomePage extends StatelessWidget {
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home_app_bar_title),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(
          RepositoryProvider.of<AuthenticationService>(context),
          RepositoryProvider.of<NoteService>(context),
        )..add(RegisterServicesEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is SuccessfulLoginState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NotesPage(
                    username: state.username,
                  ),
                ),
              );
            }
            if (state is HomeInitial) {
              if (state.error != null) {

                showDialog(
                  context: context,
                  builder: (context) => AlertDialogSwidget(errorMessage: state.error!,)
                );
              }
            }
          },
          builder: (context, state) {
            if (state is HomeInitial) {
              return Column(

                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Image(image: AssetImage('note.png')),
                  const SizedBox(
                    height: 32,
                  ),
                  InputsFieldWidget(
                    usernameField: usernameField,
                    passwordField: passwordField,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: 350, // <-- Your width
                          child: ElevatedButton(
                            onPressed: () => BlocProvider.of<HomeBloc>(context)
                              ..add(
                                LoginEvent(usernameField.text, passwordField.text),
                              ),
                            child: Text(S.of(context).home_get_started_title),
                          ),
                        ),
                      ),
                      const DividersRow(),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: 350,
                          child: ElevatedButton(
                            onPressed: () => BlocProvider.of<HomeBloc>(context)
                              ..add(
                                RegisterAccountEvent(
                                    usernameField.text, passwordField.text),
                              ),
                            child: Text(S.of(context).home_get_register_title),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(S.of(context).home_powered_by_title),
                      const SizedBox(height: 8),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: const [

                        Image(image: AssetImage('flutter_bloc.png'),width: 96, height: 96,),

                        Image(image: AssetImage('flutter_hive.png'),width: 96, height: 96,),

            ],),
                    ],
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}




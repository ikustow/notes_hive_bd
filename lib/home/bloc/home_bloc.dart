import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_hive_bd/services/authentication.dart';
import 'package:notes_hive_bd/services/notes.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationService _auth;
  final NoteService _note;

  HomeBloc(this._auth, this._note) : super(RegisteringServicesState()) {
    on<LoginEvent>((event, emit) async {
      final user = await _auth.authenticateUser(event.username, event.password);
      if (user != null) {
        emit(SuccessfulLoginState(user));
        emit(HomeInitial());
      }
    });


    on<RegisterServicesEvent>((event, emit) async {
      await _auth.init();
      await _note.init();

      emit(HomeInitial());
    });

    on<RegisterAccountEvent>((event, emit) async {
      final result = await _auth.createUser(event.username, event.password);
      switch (result) {
        case UserCreationResult.success:
          emit(SuccessfulLoginState(event.username));
          break;
        case UserCreationResult.failure:
          emit(HomeInitial(error: "There's been an error"));

          break;
        case UserCreationResult.already_exists:
          emit(HomeInitial(error: "User already exists"));

          break;
      }
    });

    }
  }


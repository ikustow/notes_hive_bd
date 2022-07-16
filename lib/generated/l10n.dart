// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Notes`
  String get home_app_bar_title {
    return Intl.message(
      'Notes',
      name: 'home_app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `GET STARTED`
  String get home_get_started_title {
    return Intl.message(
      'GET STARTED',
      name: 'home_get_started_title',
      desc: '',
      args: [],
    );
  }

  /// `REGISTER`
  String get home_get_register_title {
    return Intl.message(
      'REGISTER',
      name: 'home_get_register_title',
      desc: '',
      args: [],
    );
  }

  /// `Powered by`
  String get home_powered_by_title {
    return Intl.message(
      'Powered by',
      name: 'home_powered_by_title',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get home_username_initial {
    return Intl.message(
      'Username',
      name: 'home_username_initial',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get home_password_initial {
    return Intl.message(
      'Password',
      name: 'home_password_initial',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get home_or_title {
    return Intl.message(
      'OR',
      name: 'home_or_title',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get home_alert_message {
    return Intl.message(
      'Error',
      name: 'home_alert_message',
      desc: '',
      args: [],
    );
  }

  /// `My notes`
  String get notes_appbar_title {
    return Intl.message(
      'My notes',
      name: 'notes_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get notes_favorites_title {
    return Intl.message(
      'Favorites',
      name: 'notes_favorites_title',
      desc: '',
      args: [],
    );
  }

  /// `All notes`
  String get notes_all_notes_title {
    return Intl.message(
      'All notes',
      name: 'notes_all_notes_title',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get detail_notes_title {
    return Intl.message(
      'Title',
      name: 'detail_notes_title',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get detail_notes_hint_name {
    return Intl.message(
      'Name',
      name: 'detail_notes_hint_name',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get detail_notes_note {
    return Intl.message(
      'Note',
      name: 'detail_notes_note',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get detail_notes_hint_note {
    return Intl.message(
      'Description',
      name: 'detail_notes_hint_note',
      desc: '',
      args: [],
    );
  }

  /// `Choose background color`
  String get detail_notes_color_picker_title {
    return Intl.message(
      'Choose background color',
      name: 'detail_notes_color_picker_title',
      desc: '',
      args: [],
    );
  }

  /// `SAVE`
  String get detail_notes_save_button_title {
    return Intl.message(
      'SAVE',
      name: 'detail_notes_save_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get detail_notes_delete_button_title {
    return Intl.message(
      'Delete',
      name: 'detail_notes_delete_button_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

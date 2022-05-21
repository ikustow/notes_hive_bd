import 'package:hive/hive.dart';
import 'package:notes_hive_bd/model/user.dart';

class AuthenticationService {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>('usersBox');


    final success = await _users.values.any((element) =>
    element.username == "Demo" && element.password == "Demo");

    if (success) {
      } else {
      await _users.add(User('Demo', 'Demo'));
    }



  }

  Future<String?> authenticateUser(
      final String username, final String password) async {
    final success = await _users.values.any((element) =>
        element.username == username && element.password == password);

    if (success) {
      return username;
    } else {
      return null;
    }
  }

  Future<UserCreationResult> createUser(
      final String username, final String password) async {
    final alreadyExists = _users.values.any(
      (element) => element.username.toLowerCase() == username.toLowerCase(),
    );

    if (alreadyExists) {
      return UserCreationResult.already_exists;
    }

    try {
      _users.add(User(username, password));
      return UserCreationResult.success;
    } on Exception catch (ex) {
      return UserCreationResult.failure;
    }
  }
}

enum UserCreationResult { success, failure, already_exists }

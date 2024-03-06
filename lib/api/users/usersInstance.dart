import 'package:DeCarbon/models/User.dart';

class UsersInstance {
  User user;

  static final UsersInstance _instance = UsersInstance._internal();

  factory UsersInstance() {
    return _instance;
  }

  UsersInstance._internal();

  static UsersInstance get instance => _instance;
}
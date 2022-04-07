import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homebody/src/modules/model.dart';
import 'dart:developer';

class Database {
  static final Database _instance = Database._internal();
  Database._internal() {}

  factory Database() {
    return _instance;
  }

  static const String _userDB = "userDB";
  static const String _user = "user";

  Future<void> openDatabase() async {
    log("open database start");
    await Hive.initFlutter();
    Hive.isBoxOpen(_userDB) ? Hive.box(_userDB) : Hive.openBox(_userDB);
    Hive.registerAdapter(UserAdapter());
    log("open database done");
  }

  Future<bool> setUser(User user) async {
    log("set user $user");
    Hive.box(_userDB).put(_user, user);
    return true;
  }

  Future<User> getUser() async {
    log("get user");
    return Hive.box(_userDB).get(_user, defaultValue: InvalidUserInfo());
  }
}

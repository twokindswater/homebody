import 'package:get/get.dart';
import 'package:homebody/src/resources/login.dart';
import 'package:homebody/src/modules/model.dart';
import 'package:homebody/src/resources/database.dart';
import 'dart:developer';

class LoginController extends GetxController {
  void googleLogin() {
    Future<User> user = signInWithGoogle();
    user.then((value) {
      if (value.isValid()) {
        Database().setUser(value);
      } else {
        log("user is invalid");
      }
    }).catchError((error) {
      log("signInWithGoogle error", error: error);
    });
    update();
  }
}

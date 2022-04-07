import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homebody/src/getx/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome\nHomebody",
            style: GoogleFonts.ptSans(
                fontSize: 40.0,
                color: const Color(0xff251970),
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          _googleLoginBtn(),
        ],
      ),
    );
  }
}

class _googleLoginBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Container(
        width: 270.0,
        height: 60.0,
        child: TextButton(
          onPressed: () => controller.googleLogin(),
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Image.asset('images/google_login.png'),
          ),
        ));
  }
}

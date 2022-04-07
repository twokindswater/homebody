import 'package:flutter/material.dart';
import 'package:homebody/src/ui/login.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:homebody/src/resources/database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: initialize(),
    );
  }

  Widget initialize() {
    return FutureBuilder(
      future: dataSetup(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("firebase load fail"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Login();
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<void> dataSetup() async {
    await Firebase.initializeApp();
    await Database().openDatabase();
  }
}
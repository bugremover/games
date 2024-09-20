// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:games/screens/homepage.dart';
import 'package:games/screens/loginscreen.dart';
// import 'firebase_options.dart'; // Import firebase_options.dart

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // // Initialize Firebase with the platform-specific options
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
    );
  }
}

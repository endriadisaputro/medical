import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical/auth/auth_gate.dart';
import 'package:medical/firebase_options.dart';
import 'package:medical/themes/light_mode.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: lightMode,
    );
  }
}

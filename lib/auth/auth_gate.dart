import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical/auth/login_or_register.dart';
import 'package:medical/screen/home_screen.dart';
import 'package:medical/widgets/navbar_roots.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If user is logged in
          if (snapshot.hasData) {
            return NavbarRoots();
          }
          // user is NOT LOGGED in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}

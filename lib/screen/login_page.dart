import 'package:flutter/material.dart';
import 'package:medical/auth/auth_service.dart';
import 'package:medical/widgets/my_button.dart';
import 'package:medical/widgets/my_textfield.dart';

class LoginPage extends StatelessWidget {
  // Email dan Pw Text Controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  LoginPage({super.key, required this.onTap});

  // Tap to go to register page
  final void Function()? onTap;

  // Login method
  void login(BuildContext context) async {
    // Auth Service
    final authService = AuthService();
    // try login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    }
    // Catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            // Icon(
            //   Icons.message,
            //   size: 60,
            //   color: Theme.of(context).colorScheme.primary,
            // ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/images/doctors.png'),
            ),
            // Welcome back message

            Text(
              'Welcome back, you have been missed',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            // email textfield
            SizedBox(
              height: 20,
            ),
            MyTextfield(
              hintText: 'Email',
              obsecureText: false,
              controller: _emailController,
            ),

            // Pw textfield
            SizedBox(
              height: 10,
            ),
            MyTextfield(
              hintText: 'Password',
              obsecureText: true,
              controller: _pwController,
            ),

            // Login Button
            SizedBox(
              height: 25,
            ),
            MyButton(
              textButton: 'Login',
              onTap: () => login(context),
            ),

            // Register now
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medical/auth/auth_service.dart';
import 'package:medical/widgets/my_button.dart';
import 'package:medical/widgets/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // Email dan Pw Text Controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  RegisterPage({super.key, required this.onTap});

  // Tap to go to register page
  final void Function()? onTap;

  // Register method
  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    // password match -> create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
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
    // Password dont match -> show error to user
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Password dont match'),
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
              'Lets Create an account for you',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            // email textfield
            const SizedBox(
              height: 20,
            ),
            MyTextfield(
              hintText: 'Email',
              obsecureText: false,
              controller: _emailController,
            ),

            // Pw textfield
            const SizedBox(
              height: 10,
            ),
            MyTextfield(
              hintText: 'Password',
              obsecureText: true,
              controller: _pwController,
            ),

            // Confirm Pw textfield
            const SizedBox(
              height: 10,
            ),
            MyTextfield(
              hintText: 'Confirm Password',
              obsecureText: true,
              controller: _confirmPwController,
            ),

            // Login Button
            const SizedBox(
              height: 25,
            ),
            MyButton(
              textButton: 'Register',
              onTap: () => register(context),
            ),

            // Register now
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login Now',
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

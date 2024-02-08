import 'package:chatter/auth/auth_service.dart';
import 'package:chatter/components/my_textField.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  void Function()? onTap;



  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();
//pasword match
    if (_pwController.text == _confirmController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    //oassword dont match
    else{
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Logo
          const Center(
            child: Icon(
              Icons.message_rounded,
              size: 80,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Let's create an account",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          MyTextField(
            controller: _emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          const SizedBox(height: 15),
          MyTextField(
            controller: _pwController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 15),
          MyTextField(
            controller: _confirmController,
            hintText: 'Confirm password',
            obscureText: true,
          ),
          const SizedBox(height: 35),
          MyButton(
            onTap: () => register(context),
            title: 'Register',
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?  ',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 16),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Log in",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

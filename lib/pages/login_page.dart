import 'package:chatter/auth/auth_service.dart';
import 'package:chatter/components/my_textField.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  void Function()? onTap;

    void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  LoginPage({
    super.key,
    required this.onTap,
  });

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
            'Welcome back to Chatter',
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
          const SizedBox(height: 35),
          MyButton(
            onTap: () {
              login(context);
              print('login clicked');
            },
            title: 'Login',
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not a member?  ',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 16),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Register now!",
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

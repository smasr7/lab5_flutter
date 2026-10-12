import 'package:flutter/material.dart';
import 'package:lab5/main.dart';

final ValueNotifier<bool> isLoggedIn = ValueNotifier(false);

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign in'),
          onPressed: () {
            isLoggedIn.value = true;
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const HomeScreen())
              );
          },
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Zaloguj się'),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'E-mail'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'Hasło'),
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                    } catch (error) {
                      print(error);
                    }
                  },
                  child: const Text('Zaloguj się'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

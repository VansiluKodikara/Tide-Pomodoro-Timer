import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pomodoro_timer/pages/home.dart';
import 'package:pomodoro_timer/pages/pomodoroTimer.dart';

class emailPage extends StatefulWidget {
  const emailPage({super.key});

  @override
  State<emailPage> createState() => _emailPageState();
}

class _emailPageState extends State<emailPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        if (mounted) Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  Future<void>signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => pomodoroTimer()),
      );
    } on FirebaseAuthException catch (e) {
      String message = "An error occurred";
      if (e.code == 'user-not-found') {
        message = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password provided.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => home(),
              ),
            );
          },
          icon: const Icon(
            Icons.close_rounded,
            color: const Color(0xFF0A5BFF),
            textDirection: TextDirection.ltr,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                cursorColor: const Color(0xFF0A5BFF),
                decoration: const InputDecoration(
                    labelText: 'Email',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xFF0A5BFF),
                      ),
                    ),
                ),
                validator: (val) => val!.isEmpty ? 'Enter email' : null,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
                cursorColor: const Color(0xFF0A5BFF),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF0A5BFF),
                    ),
                  ),
                ),
                validator: (val) => val!.length < 6 ? 'Enter Password (Minimum 6 chararacters)' : null,
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: const Color(0xFF0A5BFF),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _registerUser,
                  child: const Text("Sign Up"),
                ),
              ),
                const SizedBox(height: 20),

                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                OutlinedButton(
                  onPressed: signIn,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: const Color(0xFF0A5BFF),
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("Sign In"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
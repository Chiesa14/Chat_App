import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 200),
              const Icon(
                Icons.message,
                size: 120,
                color: Color.fromARGB(255, 87, 87, 87),
              ),
              const SizedBox(height: 50),
              const Text(
                "Welcome Back to your Chatoo!!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obsecureText: false),
              const SizedBox(height: 20),
              MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecureText: true),
              const SizedBox(height: 50),
              MyButton(onTap: () => {}, text: "Sign In"),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not A memeber?",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Register now",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ))));
  }
}

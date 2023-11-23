import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void singIn() {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      authService.singInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
                  child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
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
                  MyButton(onTap: singIn, text: "Sign In"),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not A memeber?",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ))),
        ));
  }
}

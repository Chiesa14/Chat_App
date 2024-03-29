import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void singUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("The Password do not match")));
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.singUpWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      String errorMessage = e.toString().replaceAll('Exception:', '');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
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
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Icon(
                  Icons.message,
                  size: 120,
                  color: Color.fromARGB(255, 87, 87, 87),
                ),
                const SizedBox(height: 50),
                const Text(
                  "Let's create you an account in Chatoo!!",
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
                const SizedBox(height: 20),
                MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm  Password',
                    obsecureText: true),
                const SizedBox(height: 50),
                MyButton(onTap: singUp, text: "Sign Up"),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a member?",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))),
        ));
  }
}

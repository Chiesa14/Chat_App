import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRgister extends StatefulWidget {
  const LoginOrRgister({super.key});

  @override
  State<LoginOrRgister> createState() => _LoginOrRgisterState();
}

class _LoginOrRgisterState extends State<LoginOrRgister> {
  bool showLoginPage = true;

  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: tooglePages);
    } else {
      return RegisterPage(onTap: tooglePages);
    }
  }
}

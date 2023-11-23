import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String recieverUserWEmail;
  final String recieverUserUID;
  const ChatPage(
      {super.key,
      required this.recieverUserWEmail,
      required this.recieverUserUID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recieverUserWEmail),
      ),
    );
  }
}

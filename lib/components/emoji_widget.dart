import 'package:flutter/material.dart';

class EmojiWidget extends StatefulWidget {
  final Function addEmojiToTextController;

  const EmojiWidget({super.key, required this.addEmojiToTextController});

  @override
  State<EmojiWidget> createState() => _EmojiWidgetState();
}

class _EmojiWidgetState extends State<EmojiWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}

import 'package:chat_app/components/emoji_widget.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyEmojiField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const MyEmojiField(
      {super.key, required this.controller, required this.hintText});

  @override
  State<MyEmojiField> createState() => _MyEmojiFieldState();
}

class _MyEmojiFieldState extends State<MyEmojiField> {
  bool emojiShown = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (emojiShown)
        EmojiWidget(addEmojiToTextController: addEmojiToTextController),
      TextField(
        controller: widget.controller,
        obscureText: false,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.grey[200],
            filled: true,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: GestureDetector(
              onTap: () async {
                if (emojiShown) {
                  setState(() {
                    emojiShown = false;
                  });
                  await Future.delayed(const Duration(milliseconds: 500))
                      .then((value) async {
                    await SystemChannels.textInput
                        .invokeMethod("TextInput.show");
                  });
                } else {
                  await SystemChannels.textInput.invokeMethod("TextInput.hide");
                  setState(() {
                    emojiShown = true;
                  });
                }
              },
              child: Icon(
                emojiShown ? Icons.keyboard : Icons.emoji_emotions,
                color: Colors.blue,
              ),
            )),
      ),
    ]);
  }

  addEmojiToTextController({required Emoji emoji}) {}
}

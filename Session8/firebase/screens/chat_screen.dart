import 'dart:js_interop';

import 'package:firebase_project/models/chat_screen_arguments.dart';
import 'package:firebase_project/theme/themes.dart';
import 'package:firebase_project/widgets/my_text_field.dart';
import 'package:firebase_project/widgets/text_bubble.dart';
import 'package:flutter/material.dart';

import '../services/chat/chat_interface.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.8),
        centerTitle: false,
        title: Text(
          args.name,
          style: kMainTextStyle.copyWith(
              fontSize: 20, letterSpacing: 8, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: MessagesList(personOneId: args.uid)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: MyTextField(
                    hintText: 'type away ...',
                    obscureText: false,
                    textController: textController,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  sendMessage(
                      text: textController.text,
                      receiverId: args.uid,
                      receiverName: args.name);
                  textController.clear();
                },
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.arrow_circle_up,
                    size: 40,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

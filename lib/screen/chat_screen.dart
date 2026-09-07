import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import '../service/planet_api.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  PlanetChat api = PlanetChat();

  ChatUser child = ChatUser(id: '1', firstName: 'Explorer');
  ChatUser spaceBuddy = ChatUser(id: '2', firstName: 'Space Buddy');

  List<ChatMessage> messagesList = [];

  bool buddyIsTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B1026),
      appBar: AppBar(
        backgroundColor: Color(0xFF2B1055),
        centerTitle: true,
        title: Text(
          "Little Explorer 🚀",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: DashChat(
        currentUser: child,
        messages: messagesList,
        typingUsers: buddyIsTyping ? [spaceBuddy] : [],
        messageOptions: MessageOptions(
          currentUserContainerColor: Color(0xFF7C4DFF),
          containerColor: Color(0xFF1E2A4A),
          textColor: Colors.white,
          avatarBuilder: (p0, onPressAvatar, onLongPressAvatar) {
            return Text("🧑‍🚀", style: TextStyle(fontSize: 28));
          },
        ),
        inputOptions: InputOptions(
          alwaysShowSend: true,
          inputTextStyle: TextStyle(color: Colors.white),
          inputDecoration: InputDecoration(
            hintText: "Ask me about space! ✨",
            hintStyle: TextStyle(color: Colors.white38),
            filled: true,
            fillColor: Color(0xFF1E2A4A),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
          sendButtonBuilder: (send) => IconButton(
            onPressed: send,
            icon: Text("🚀", style: TextStyle(fontSize: 26)),
          ),
        ),
        onSend: (message) async {
          messagesList.insert(0, message);
          setState(() {
            buddyIsTyping = true;
          });

          String botMessage = await api.askPlanet(message.text);

          ChatMessage reply = ChatMessage(
            user: spaceBuddy,
            createdAt: DateTime.now(),
            text: botMessage,
          );
          messagesList.insert(0, reply);
          setState(() {
            buddyIsTyping = false;
          });
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:learning_flutter/login_page.dart';
import 'package:learning_flutter/widgets/chat_bubble.dart';
import 'package:learning_flutter/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: const Text('Chat Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            //fit: FlexFit.tight,
            //flex: 3,
            child: ListView(
              children: [
                ChatBubble(alignment: Alignment.centerLeft, message: "Hi. this is a message!"),
                ChatBubble(alignment: Alignment.centerRight, message: "Hi!"),
                ChatBubble(alignment: Alignment.centerLeft, message: "How are you?"),
              ],
            ),
          ),
          ChatInput()
        ],
      ),
    );
  }
  
}

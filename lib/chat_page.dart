import 'package:flutter/material.dart';
import 'package:learning_flutter/widgets/chat_bubble.dart';
import 'package:learning_flutter/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            //fit: FlexFit.tight,
            //flex: 3,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ChatBubble(
                  alignment: index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                  message: "Hi. this is a message!",
                );
              },
            ), 
          ),
          ChatInput()
        ],
      ),
    );
  }
  
}

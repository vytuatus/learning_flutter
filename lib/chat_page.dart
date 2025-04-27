import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/models/chat_message_entity.dart';
import 'package:learning_flutter/models/image_model.dart';
import 'package:learning_flutter/repo/image_repository.dart';
import 'package:learning_flutter/widgets/chat_bubble.dart';
import 'package:learning_flutter/widgets/chat_input.dart';

class ChatPage extends StatefulWidget {
  ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    final response = await rootBundle.loadString('mock_messages.json');
    final List<dynamic> decodedJson = jsonDecode(response) as List;
    final List<ChatMessageEntity> _chatMessages = decodedJson.map((listItem) => ChatMessageEntity.fromJson(listItem)).toList();
    //print(_chatMessages.length);
    print("kurwa");
    setState(() {
      _messages = _chatMessages;
    });
  }

  _addMessage(ChatMessageEntity message) {
    setState(() {
      _messages.add(message);
    });
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }
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
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  alignment: _messages[index].author.userName == 'vyts1' ? Alignment.centerRight : Alignment.centerLeft,
                  chatMessageEntity: _messages[index],
                );
              },
            ), 
          ),
          ChatInput(onSendMessage: _addMessage),
        ],
      ),
    );
  }
}

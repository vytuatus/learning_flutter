import 'package:flutter/material.dart';
import 'package:learning_flutter/models/chat_message_entity.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSendMessage;
  ChatInput({
    super.key, required this.onSendMessage, 
  });

  final chatMessageController = TextEditingController();

  void sendMessage() {
    
    final newChatMessage = ChatMessageEntity(
      text: chatMessageController.text, 
      id: "244", 
      createdAt: DateTime.now().millisecondsSinceEpoch, 
      author: Author(userName: "vyts1"),
    );

    onSendMessage(newChatMessage);
    chatMessageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
              bottom: Radius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
                color: Colors.white,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                  textCapitalization: TextCapitalization.sentences,
                  controller: chatMessageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: sendMessage,
                color: Colors.white,
              ),
            ],
          ),
        );
  }
}

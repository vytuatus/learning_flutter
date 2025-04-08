import 'package:flutter/material.dart';
import 'package:learning_flutter/models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity chatMessageEntity;
  final Alignment alignment;

  const ChatBubble({
    super.key,
    required this.alignment,
    required this.chatMessageEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              chatMessageEntity.text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            if (chatMessageEntity.imageUrl != null)
              Image.network(
                "${chatMessageEntity.imageUrl}",
                height: 200,
              ),
          ],
        ),
      ),
    );
  }
}
 
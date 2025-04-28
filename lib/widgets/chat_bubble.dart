import 'package:flutter/material.dart';
import 'package:learning_flutter/models/chat_message_entity.dart';
import 'package:learning_flutter/services/auth.dart';
import 'package:provider/provider.dart';

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
  bool isAuthor = chatMessageEntity.author.userName == context.read<AuthService>().getCurrentUser();
    
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: isAuthor? Theme.of(context).primaryColor : Colors.grey,
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
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(chatMessageEntity.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
 
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({
    super.key,
  });

  final chatMessageController = TextEditingController();

  void sendMessage() {
    print(chatMessageController.text);
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

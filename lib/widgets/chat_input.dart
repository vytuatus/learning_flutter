import 'package:flutter/material.dart';
import 'package:learning_flutter/models/chat_message_entity.dart';
import 'package:learning_flutter/services/auth.dart';
import 'package:learning_flutter/widgets/picker_body.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSendMessage;
  ChatInput({
    super.key, required this.onSendMessage, 
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedImageUri = "";

  final chatMessageController = TextEditingController();

  void sendMessage() {
    
    final newChatMessage = ChatMessageEntity(
      text: chatMessageController.text, 
      id: "244", 
      createdAt: DateTime.now().millisecondsSinceEpoch, 
      author: Author(userName: AuthService().getCurrentUser()!),
    );
    if (_selectedImageUri.isNotEmpty) {
      newChatMessage.imageUrl = _selectedImageUri; // Add the image URL to the message
    }
    if (chatMessageController.text.isEmpty && _selectedImageUri.isEmpty) {
      return; // Do not send empty messages
    }
    widget.onSendMessage(newChatMessage);
    chatMessageController.clear();
    _selectedImageUri = ""; // Clear the selected image URI after sending the message
    setState(() {}); // Update the UI to reflect the cleared image
  }

  void onImageSelected(String newImageUrl) {
    setState(() {
      _selectedImageUri = newImageUrl;
    });
    Navigator.pop(context); // Close the bottom sheet after selecting an image
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                onPressed: () {
                  showModalBottomSheet(
                    context: context, 
                    builder: (context) {
                        return NetworkImagePicker(onImageSelected: onImageSelected);
                      },
                    );
                },
                color: Colors.white,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
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
                    if (_selectedImageUri.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.network(_selectedImageUri, height: 50,),
                      ),
                  ],
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

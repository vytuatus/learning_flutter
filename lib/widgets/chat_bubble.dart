import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final Alignment alignment;
  final String message;

  const ChatBubble({
    Key? key,
    required this.alignment,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
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
              message,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Image.network(
              "https://picsum.photos/250?image=9",
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
 
//  In the above code, we have created a new widget called  ChatBubble  that takes two required parameters:  alignment  and  message . The  alignment  parameter is of type  Alignment  and the  message  parameter is of type  String . 
//  The  ChatBubble  widget is a stateless widget that returns an  Align  widget with a  Container  as its child. The  Container  widget has a  BoxDecoration  with a grey color and rounded corners. Inside the  Container , we have a  Column  widget with two children: a  Text  widget and an  Image  widget. 
//  The  ChatBubble  widget is used in the  ChatPage  widget to display chat bubbles. 
//  Step 3: Update the ChatPage widget 
//  Now, let’s update the  ChatPage  widget to use the  ChatBubble  widget. 
//  Replace the code in  lib/chat_page.dart  with the following code:
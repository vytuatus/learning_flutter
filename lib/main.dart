import 'package:flutter/material.dart';
import 'package:learning_flutter/chat_page.dart';
import 'package:learning_flutter/counter_stateful_demo.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: CounterStatefulDemo(buttonColor: Colors.black,),
    );
  }
}

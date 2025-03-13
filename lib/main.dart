import 'package:flutter/material.dart';
import 'package:learning_flutter/chat_page.dart';
import 'package:learning_flutter/login_page.dart';

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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black
        ),
      ),
      // home: CounterStatefulDemo(buttonColor: Colors.black,),
      home: LoginPage(),
      routes: {
        //'/login': (context) => LoginPage(),
        '/chat': (context) => ChatPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {print("Button Clicked");}, child: Icon(Icons.add),),
      body: Column(
        children: [
          Text(
            "Let's sign you in!", 
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
              letterSpacing: 1.5,
            ),
       ),
          Center(
            child: Text(
              "Welcome back! \n You've been missed!", 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Image.network(
            'https://picsum.photos/250?image=9',
            height: 200,
            ),
          Container(
            width: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
              // image: DecorationImage(
              //   image: NetworkImage('https://picsum.photos/250?image=9'),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/textfield_styles.dart';
import 'package:learning_flutter/widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();

  void loginButton(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordNameController.text);

      // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(username: userNameController.text,)));
      Navigator.pushReplacementNamed(context, '/chat', arguments: userNameController.text);

      print('Login successful');   
    } else {
      print('Login failed');
    }
  }

  final userNameController = TextEditingController();
  final passwordNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Let's sign you in!", 
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                  letterSpacing: 1.5,
                ),
           ),
              Text(
                "Welcome back! \n You've been missed!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Image.network(
                'https://picsum.photos/250?image=9',
                height: 200,
                ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginTextField(
                      validator: (value) {
                        if (value != null && value.isNotEmpty && value.length < 5) {
                          return 'User name must be more than 5 characters';
                        } else if (value == null || value.isEmpty) {
                          return 'User name cannot be empty';
                        }
                        return null;
                      },
                      controller: userNameController,
                      hintText: 'User name',
                    ),
                    SizedBox(height: 10),
                    LoginTextField(
                      controller: passwordNameController,
                      obscureText: true,
                      hintText: 'Password',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  loginButton(context);
                },
                child: Text('Sign in'),
              ),
              InkWell(
                splashColor: Colors.red,
                onTap: () {
                  print('Link clicked');
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text('www.google.com'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:learning_flutter/services/auth.dart';
import 'package:learning_flutter/utils/spaces.dart';
import 'package:learning_flutter/widgets/login_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_buttons/social_media_buttons.dart';


class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();

  void loginButton(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordNameController.text);
      AuthService().Login(userNameController.text, passwordNameController.text);
      AuthService().setUser(userNameController.text);

      // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(username: userNameController.text,)));
      Navigator.pushReplacementNamed(context, '/chat', arguments: userNameController.text);

      print('Login successful');   
    } else {
      print('Login failed');
    }
  }

  final userNameController = TextEditingController();
  final passwordNameController = TextEditingController();
  final _mainUrl = 'https://www.google.com';
  final _fallbackUrl = 'https://www.google.com';

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
              verticalSpacing(space: 24),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('login_picture.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              verticalSpacing(space: 24),
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
                    verticalSpacing(space: 24),
                    LoginTextField(
                      controller: passwordNameController,
                      obscureText: true,
                      hintText: 'Password',
                    ),
                  ],
                ),
              ),
              verticalSpacing(space: 24),
              ElevatedButton(
                onPressed: () {
                  loginButton(context);
                },
                child: Text('Sign in'),
              ),
              InkWell(
                splashColor: Colors.red,
                onTap: () async{
                  print('Link clicked');
                  if (!await launchUrl(Uri.parse(_mainUrl), mode: LaunchMode.externalApplication)) {
                    print('Could not launch $_mainUrl');
                    throw 'Could not launch $_mainUrl';
                  }
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text('www.google.com'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaButton.twitter(url: "https://twitter.com/", color: Colors.blue,),
                  SocialMediaButton.linkedin(url: "https://www.linkedin.com/"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
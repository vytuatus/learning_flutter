import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/textfield_styles.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: ThemeTextStyle.loginTextFieldStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
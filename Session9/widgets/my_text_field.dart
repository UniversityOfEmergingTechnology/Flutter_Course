import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.textController});

  final String hintText;
  final bool obscureText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: TextField(
        maxLines: 1,
        autocorrect: false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(26),
        ],
        cursorColor: Theme.of(context).colorScheme.tertiary,
        controller: textController,
        obscureText: obscureText,
        style: TextStyle(
          letterSpacing: 4,
          fontSize: 15,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(24),
          hintStyle: TextStyle(letterSpacing: 4, fontSize: 15),
          hintFadeDuration: Duration(milliseconds: 500),
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
    );
  }
}

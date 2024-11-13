import 'package:firebase_project/theme/themes.dart';
import 'package:firebase_project/widgets/loading_button.dart';
import 'package:firebase_project/widgets/my_filled_button.dart';
import 'package:firebase_project/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

import '../services/authentication/auth_interface.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool absorb = false;

  void setAbsorb(bool value) {
    setState(() {
      absorb = value;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorb,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Icon(
                    Icons.chat_bubble,
                    size: 60,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('welcome to communication', style: kMainTextStyle),
                  SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                      hintText: 'email',
                      obscureText: false,
                      textController: emailController),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                      hintText: 'password',
                      obscureText: true,
                      textController: passwordController),
                  SizedBox(
                    height: 25,
                  ),
                  absorb
                      ? LoadingButton()
                      : MyFilledButton(
                          title: 'log in',
                          onTap: () {
                            setAbsorb(true);
                            logIn(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then(
                              (value) => setAbsorb(false),
                            );
                          },
                        ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'new here? ',
                        style: kMainTextStyle.copyWith(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: Text(
                          'sign up',
                          style: kMainTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

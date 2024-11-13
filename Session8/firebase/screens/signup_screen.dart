import 'package:firebase_project/services/authentication/auth_interface.dart';
import 'package:firebase_project/theme/themes.dart';
import 'package:firebase_project/widgets/loading_button.dart';
import 'package:firebase_project/widgets/my_filled_button.dart';
import 'package:firebase_project/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController nameController;
  late final TextEditingController confirmPasswordController;
  bool absorb = false;

  setAbsorb(bool value) {
    setState(() {
      absorb = value;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
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
                    height: MediaQuery.of(context).size.height * 0.1,
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
                      hintText: 'name',
                      obscureText: false,
                      textController: nameController),
                  SizedBox(
                    height: 25,
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
                  MyTextField(
                      hintText: 'confirm password',
                      obscureText: true,
                      textController: confirmPasswordController),
                  SizedBox(
                    height: 25,
                  ),
                  absorb
                      ? LoadingButton()
                      : MyFilledButton(
                          title: 'sign up',
                          onTap: () {
                            setAbsorb(true);
                            signUp(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    confirmPassword:
                                        confirmPasswordController.text,
                                    name: nameController.text,
                                    context: context)
                                .then((value) => setAbsorb(false));
                          },
                        ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'been here? ',
                        style: kMainTextStyle.copyWith(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text(
                          'log in',
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

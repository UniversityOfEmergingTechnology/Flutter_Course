import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/firebase_options.dart';
import 'package:firebase_project/screens/blocked_users_screen.dart';
import 'package:firebase_project/screens/chat_screen.dart';
import 'package:firebase_project/screens/home_screen.dart';
import 'package:firebase_project/screens/login_screen.dart';
import 'package:firebase_project/screens/settings_screen.dart';
import 'package:firebase_project/screens/signup_screen.dart';
import 'package:firebase_project/theme/theme_provider.dart';
import 'package:firebase_project/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/chatscreen': (context) => const ChatScreen(),
        '/blockedUsersScreen': (context) => const BlockedUsersScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: LoginScreen(),
    );
  }
}

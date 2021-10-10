import 'package:flash_chart/screens/chat_screen.dart';
import 'package:flash_chart/screens/login_screen.dart';
import 'package:flash_chart/screens/registration_screen.dart';
import 'package:flash_chart/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/chat': (context) => ChatScreen(),
        '/login': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen()
      },
      initialRoute: '/welcome',
    );
  }
}

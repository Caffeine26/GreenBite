import 'package:flutter/material.dart';
import 'package:greenbite_app/screens/login_and_register/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenBite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF18542A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF18542A),
          primary: const Color(0xFF18542A),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
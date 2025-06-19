import 'package:flutter/material.dart';
// import 'package:greenbite_app/screens/login_and_register/welcome_screen.dart';
// import 'package:greenbite_app/screens/about_us/about_us.dart';
// import 'package:greenbite_app/screens/privacypolicy/privacy_policy.dart';
// import 'package:greenbite_app/components/popup/menu.dart';
// import 'package:greenbite_app/components/popup/notification.dart ';
import 'package:greenbite_app/components/popup/search.dart  ';

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
      // home: const WelcomeScreen(),
      // home: const AboutUsPage(),
      // home: const PrivacyPolicyPage(),
      // home: const MenuPopup(),
      // home: const NotificationPopup(),
      home: const SearchPopup(),
    );
  }
  
}
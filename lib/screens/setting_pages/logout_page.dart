// logout_page.dart
import 'package:flutter/material.dart';
import 'settings_screen.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged out'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
      ),
      body: const Center(
        child: Text('You have loged out')
      )
    );
   
  }
}

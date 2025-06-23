import 'package:flutter/material.dart';
import 'logout_page.dart'; // 🔁 Import your log out destination page

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationEnabled = false;
  bool isSoundEnabled = true;
  String selectedLanguage = 'English';

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          title: const Text('Select Language'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                setState(() => selectedLanguage = 'English');
                Navigator.pop(context);
              },
              child: const Text('English'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() => selectedLanguage = 'Khmer');
                Navigator.pop(context);
              },
              child: const Text('Khmer'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() => selectedLanguage = 'Korean');
                Navigator.pop(context);
              },
              child: const Text('Korean'),
            ),
          ],
        );
      },
    );
  }

  void _handleLogout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LogoutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF18542A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        // centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Edit Profile Information'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/account-edit');
            },
          ),
          ListTile(
            title: const Text('Notification Permission'),
            trailing: Transform.scale(
              scale: 0.95, // 👈 This makes the switch smaller
              child: Switch(
                value: isNotificationEnabled,
                activeColor: Colors.green[900],
                onChanged: (value) {
                  setState(() {
                    isNotificationEnabled = value;
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: const Text('Sound Effect'),
            trailing: Transform.scale(
              scale: 0.93,
              child: Switch(
                value: isSoundEnabled,
                activeColor: Colors.green[900],
                onChanged: (value) {
                  setState(() {
                    isSoundEnabled = value;
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: const Text('Language'),
            trailing: Text(
              selectedLanguage,
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: _showLanguageDialog,
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text('Log Out', style: TextStyle(color: Colors.red)),
            onTap: _handleLogout,
          ),
        ],
      ),
    );
  }
}

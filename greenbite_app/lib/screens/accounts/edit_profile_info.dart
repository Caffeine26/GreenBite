import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileInfo extends StatefulWidget {
  const EditProfileInfo({super.key});

  @override
  _EditProfileInfoState createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  File? _image;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? 'KiKi';
      usernameController.text = prefs.getString('username') ?? 'kiki_do_u_love_me';
      bioController.text = prefs.getString('bio') ?? 'when life gives you lemons, make mojito';
      emailController.text = prefs.getString('email') ?? 'kikil27@gmail.com';
      phoneController.text = prefs.getString('phone') ?? '012 345 678';
      passwordController.text = prefs.getString('password') ?? 'password';

      String? imagePath = prefs.getString('profile_image');
      if (imagePath != null && File(imagePath).existsSync()) {
        _image = File(imagePath);
      }
    });
  }

  Future<void> _saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('username', usernameController.text);
    await prefs.setString('bio', bioController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('password', passwordController.text);
    if (_image != null) {
      await prefs.setString('profile_image', _image!.path);
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await _saveProfileData();
    }
  }

  void _onFieldChanged() {
    _saveProfileData();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade50,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile Information',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null
                    ? FileImage(_image!)
                    : const AssetImage('assets/images/profile.png') as ImageProvider,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Edit picture',
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            _buildTextRow('Name', nameController),
            _buildTextRow('Username', usernameController),
            _buildTextRow('Bio', bioController),
            _buildTextRow('Email', emailController),
            _buildTextRow('Phone Number', phoneController),
            _buildTextRow('Password', passwordController, obscureText: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTextRow(String label, TextEditingController controller, {bool obscureText = false}) {
    controller.addListener(_onFieldChanged); // Save when typing

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
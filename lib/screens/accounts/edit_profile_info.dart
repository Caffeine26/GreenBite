import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfileInfo extends StatefulWidget {
  const EditProfileInfo({super.key});

  @override
  State<EditProfileInfo> createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  File? _image;
  String? imageUrl;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      final data = doc.data();

      if (data != null) {
        setState(() {
          nameController.text = data['name'] ?? '';
          usernameController.text = data['username'] ?? '';
          bioController.text = data['bio'] ?? '';
          phoneController.text = data['phone'] ?? '';
          imageUrl = data['imageUrl'];
          emailController.text = _auth.currentUser?.email ?? '';
          passwordController.text = '********'; // Placeholder for visibility only
        });
      }
    } catch (e) {
      debugPrint('Failed to load profile: $e');
    }
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    setState(() => _isSaving = true);

    String? uploadedImageUrl = imageUrl;

    if (_image != null) {
      final ref = _storage.ref().child('profile_images/$uid.jpg');
      await ref.putFile(_image!);
      uploadedImageUrl = await ref.getDownloadURL();
    }

    await _firestore.collection('users').doc(uid).set({
      'name': nameController.text.trim(),
      'username': usernameController.text.trim(),
      'bio': bioController.text.trim(),
      'phone': phoneController.text.trim(),
      'imageUrl': uploadedImageUrl,
    }, SetOptions(merge: true));

    if (mounted) {
      setState(() => _isSaving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated')),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
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
          onPressed: () => Navigator.pushReplacementNamed(context, '/setting'),
        ),
        title: const Text(
          'Edit Profile Information',
          style: TextStyle(color: Colors.white),
        ),
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
                    : (imageUrl != null
                        ? NetworkImage(imageUrl!)
                        : const AssetImage('assets/images/profile.png'))
                        as ImageProvider,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Edit picture',
              style: TextStyle(
                color: Color(0xFF18542A),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            _buildTextRow('Name', nameController),
            _buildTextRow('Username', usernameController),
            _buildTextRow('Bio', bioController),
            _buildTextRow('Email', emailController, enabled: false),
            _buildTextRow('Phone Number', phoneController),
            _buildTextRow('Password', passwordController, obscureText: true, enabled: false),

            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: _isSaving ? null : _saveProfile,
                icon: const Icon(Icons.save, size: 18, color: Colors.white),
                label: _isSaving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text(
                        'Save Changes',
                        style: TextStyle(color: Colors.white),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF18542A),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextRow(
    String label,
    TextEditingController controller, {
    bool obscureText = false,
    bool enabled = true,
  }) {
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
              enabled: enabled,
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

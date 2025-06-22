import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:greenbite_app/components/RecipePostCard.dart';
import 'package:greenbite_app/screens/accounts/edit_profile_info.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Uint8List? _pickedImageBytes;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() {
        _pickedImageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFEFF4E8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Text(
                                "KiKi",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Icon(Icons.settings, size: 22),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text("kiki_do_u_love_me"),
                        const SizedBox(height: 4),
                        const Text("2 Posts    12 Scores"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "When life gives you lemons, make mojitos",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Add post"),
                  onPressed: _pickImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 179, 12),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit profile"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfileInfo()),
                    );
                  },
                ),
              ],
            ),
            const Divider(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text("Posts", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            RecipePostCard(
              username: "KiKi",
              date: "8 March",
              description:
                  "Bay Kork Veggies Fried Rice\nA quick and tasty way to use leftover veggies and shrimp",
              imageUrl: 'assets/images/fried-rice.jpg',
              likes: 3,
            ),
            RecipePostCard(
              username: "KiKi",
              date: "8 March",
              description:
                  "Look what I made for my family today! Very delicious\n#leftover #creative #nofoodwaste",
              imageUrl: 'assets/images/fried-chicken.jpg',
              likes: 9,
            ),
            if (_pickedImageBytes != null)
              RecipePostCard(
                username: "KiKi",
                date: "Today",
                description: "My new recipe upload!",
                imageBytes: _pickedImageBytes,
                likes: 0,
              ),
          ],
        ),
      ),
    );
  }
}

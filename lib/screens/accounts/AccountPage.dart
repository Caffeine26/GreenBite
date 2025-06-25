import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:greenbite_app/components/navigation.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/RecipePostCard.dart';
import 'package:greenbite_app/screens/accounts/edit_profile_info.dart';
import '../../components/SharePopup.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Uint8List? _pickedImageBytes;

  // Initial posts count and scores
  int _postCount = 2;
  int _score = 10;

  final List<Map<String, dynamic>> _posts = [
    {
      'username': "KiKi",
      'date': "8 March",
      'description':
          "Bay Kork Veggies Fried Rice\nA quick and tasty way to use leftover veggies and shrimp",
      'imageUrl': 'assets/images/fried-rice.jpg',
      'likes': 3,
      'comments': <Map<String, String>>[],
    },
    {
      'username': "KiKi",
      'date': "8 March",
      'description':
          "Look what I made for my family today! Very delicious\n#leftover #creative #nofoodwaste",
      'imageUrl': 'assets/images/fried-chicken.jpg',
      'likes': 9,
      'comments': <Map<String, String>>[],
    },
  ];
  int _selectedIndex = 4; // Community tab selected

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/favorite');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/upload');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/community');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/account');
        break;
    }
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() {
        _pickedImageBytes = bytes;

        _posts.insert(0, {
          'username': "KiKi",
          'date': "Today",
          'description': "My new recipe upload!",
          'imageBytes': bytes,
          'likes': 0,
          'comments': <Map<String, String>>[],
        });

        // Increase post count by 1
        _postCount += 1;

        // Increase score by 5
        _score += 5;
      });
    }
  }

  void _showSharePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => const SharePopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Navigation(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF18542A),
        elevation: 0,
        title: const Text('Account', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, '/home'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
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
                          children: [
                            Expanded(
                              child: Text(
                                "KiKi",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.settings, size: 22),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/account-edit',
                                );
                              },
                            ),
                          ],
                        ),
                        // const SizedBox(height: 4),
                        const Text("kiki_do_u_love_me"),
                        const SizedBox(height: 4),
                        Text("$_postCount Posts    $_score Scores"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "When life gives you lemons, make mojitos",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Add post"),
                  onPressed: _pickImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF18542A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit profile"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileInfo(),
                      ),
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
                child: Text(
                  "Posts",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ..._posts.map((post) {
              return RecipePostCard(
                username: post['username'],
                date: post['date'],
                description: post['description'],
                imageUrl: post['imageUrl'],
                imageBytes: post['imageBytes'],
                likes: post['likes'],
                comments: post['comments'] ?? [],
                onLike: () {
                  setState(() {
                    post['likes']++;
                  });
                },
                onComment: (text) {
                  setState(() {
                    post['comments'].add({'user': 'KiKi', 'text': text});
                  });
                },
                onShare: () => _showSharePopup(context),
              );
            }).toList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

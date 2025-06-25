import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:greenbite_app/components/navigation.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/RecipePostCard.dart';
import '../../components/SharePopup.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final TextEditingController _descriptionController = TextEditingController();
  Uint8List? _pickedImageBytes;

  final List<Map<String, dynamic>> _posts = [
    {
      'username': 'KiKi',
      'date': 'today 8h ago',
      'description':
          "Bay Kork Veggies Fried Rice\nA quick and tasty way to use leftover veggies and shrimp",
      'imageUrl': 'assets/images/fried-rice.jpg',
      'likes': 3,
      'comments': <Map<String, String>>[],
    },
    {
      'username': 'KiKi',
      'date': '19 June',
      'description':
          "Look what I made for my family today! Very delicious\n#leftover #creative #nofoodwaste",
      'imageUrl': 'assets/images/fried-chicken.jpg',
      'likes': 9,
      'comments': <Map<String, String>>[],
    },
  ];

  int _selectedIndex = 3; // Community tab selected

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
      });
    }
  }

  void _cancelPost() {
    setState(() {
      _descriptionController.clear();
      _pickedImageBytes = null;
    });
  }

  void _submitPost() {
    if (_descriptionController.text.isEmpty && _pickedImageBytes == null)
      return;

    setState(() {
      _posts.insert(0, {
        'username': 'KiKi',
        'date': 'Today',
        'description':
            _descriptionController.text.trim().isEmpty
                ? "My new recipe upload!"
                : _descriptionController.text.trim(),
        'imageBytes': _pickedImageBytes,
        'likes': 0,
        'comments': <Map<String, String>>[],
      });

      _descriptionController.clear();
      _pickedImageBytes = null;
    });
  }

  void _showSharePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SharePopup();
      },
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
        title: const Text('Community', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, '/home'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "What's your recipes today, KiKi?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextField(
                            controller: _descriptionController,
                            maxLines: null,
                            decoration: const InputDecoration(
                              hintText: "Write your description...",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: _pickImage,
                          icon: const Icon(Icons.image_outlined),
                          label: const Text("Add Photos & Videos"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade50,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              onPressed: _cancelPost,
                              child: const Text("Cancel"),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(0xFF18542A),
                                side: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: _submitPost,
                              child: const Text("Post"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF18542A),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (_pickedImageBytes != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.memory(_pickedImageBytes!, height: 150),
                ),
              ),
            const Divider(thickness: 1, height: 30),
            ..._posts.map((post) {
              return RecipePostCard(
                username: post['username'],
                date: post['date'],
                description: post['description'],
                imageBytes: post['imageBytes'],
                imageUrl: post['imageUrl'],
                likes: post['likes'],
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
                comments: post['comments'],
              );
            }).toList(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

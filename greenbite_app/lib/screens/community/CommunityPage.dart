import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:greenbite_app/components/RecipePostCard.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final TextEditingController _descriptionController = TextEditingController();
  File? _pickedImage;

  List<Map<String, dynamic>> _posts = [
    {
      'username': 'KiKi',
      'date': 'today 8h ago',
      'description':
          "Bay Kork Veggies Fried Rice\nA quick and tasty way to use leftover veggies and shrimp",
      'imageUrl': 'assets/images/fried-rice.jpg',
      'likes': 3,
      'comments': []
    },
    {
      'username': 'KiKi',
      'date': '19 June',
      'description':
          "Look what I made for my family today! Very delicious\n#leftover #creative #nofoodwaste",
      'imageUrl': 'assets/images/fried-chicken.jpg',
      'likes': 9,
      'comments': []
    },
  ];

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _pickedImage = File(picked.path);
      });
    }
  }

  void _cancelPost() {
    setState(() {
      _descriptionController.clear();
      _pickedImage = null;
    });
  }

  void _submitPost() {
    if (_descriptionController.text.isEmpty && _pickedImage == null) return;

    setState(() {
      _posts.insert(0, {
        'username': 'KiKi',
        'date': 'Today',
        'description': _descriptionController.text.isEmpty
            ? "My new recipe upload!"
            : _descriptionController.text,
        'image': _pickedImage,
        'likes': 0,
        'comments': []
      });
      _descriptionController.clear();
      _pickedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Back', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Input Section (without white container)
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
                              fontSize: 16, fontWeight: FontWeight.w500),
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
                                horizontal: 16, vertical: 12),
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
                                foregroundColor: Colors.green,
                                side: const BorderSide(color: Colors.transparent),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: _submitPost,
                              child: const Text("Post"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
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

            // Preview selected image
            if (_pickedImage != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(_pickedImage!, height: 150),
                ),
              ),

            const Divider(thickness: 1, height: 30),

            // Post Feed
            ..._posts.map((post) {
              final commentController = TextEditingController();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipePostCard(
                    username: post['username'],
                    date: post['date'],
                    description: post['description'],
                    imageFile: post['image'],
                    imageUrl: post['imageUrl'],
                    likes: post['likes'],
                    onLike: () {
                      setState(() {
                        post['likes']++;
                      });
                    },
                    onComment: (text) {
                      setState(() {
                        post['comments'].add(text);
                      });
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: commentController,
                            decoration: InputDecoration(
                              hintText: "Comment as KiKi",
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (commentController.text.isNotEmpty) {
                              setState(() {
                                post['comments'].add(commentController.text);
                                commentController.clear();
                              });
                            }
                          },
                          icon: const Icon(Icons.send, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

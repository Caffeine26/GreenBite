import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  String fullName = 'User';
  int score = 0;
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        final data = userDoc.data()!;
        setState(() {
          fullName = data['username'] ?? 'User';
          score = data['score'] ?? 0;
          imageUrl = data['imageUrl'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: imageUrl != null
                    ? NetworkImage(imageUrl!)
                    : const AssetImage('assets/images/profile.png') as ImageProvider,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, $fullName',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your scores: $score',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFED766),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.orange,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.pushNamed(context, '/score');
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.notifications_outlined),
              const SizedBox(width: 16),
              const Icon(Icons.menu),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        children: [
          // Divider line
          Container(height: 1, width: double.infinity, color: Colors.white),
          const SizedBox(height: 16),

          // Social Media Title
          Text(
            'Our Social Media',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),

          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.facebook, size: 24, color: Colors.grey),
              SizedBox(width: 20),
              Icon(Icons.usb_rounded, size: 24, color: Colors.grey),
              SizedBox(width: 20),
              Icon(Icons.favorite, size: 24, color: Colors.grey),
              SizedBox(width: 20),
              Icon(Icons.tiktok, size: 24, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 16),

          // Copyright text
          Text(
            '©2025 GreenBites. All Rights Reserved.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

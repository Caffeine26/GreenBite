import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});
  
  static const Color _greenColor = Color(0xFF8BAA96); // soft green

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        children: [
          // Divider line
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          
          // Social Media Title
          Text(
            'Our Social Media',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: _greenColor,
            ),
          ),
          const SizedBox(height: 12),
          
          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(FontAwesomeIcons.facebook, size: 24, color: _greenColor),
              SizedBox(width: 20),
              Icon(FontAwesomeIcons.instagram, size: 24, color: _greenColor),
              SizedBox(width: 20),
              Icon(FontAwesomeIcons.xTwitter, size: 24, color: _greenColor),
              SizedBox(width: 20),
              Icon(FontAwesomeIcons.tiktok, size: 24, color: _greenColor),
            ],
          ),
          const SizedBox(height: 16),
          
          // Copyright text
          Text(
            '©2025 GreenBites. All Rights Reserved.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: _greenColor,
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
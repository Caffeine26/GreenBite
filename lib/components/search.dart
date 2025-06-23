import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.search,
              size: 20,
              color: Colors.green, // Adjust based on your design
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for recipe here',
                border: InputBorder.none,
                isCollapsed: true, // Shrinks the text vertically
              ),
            ),
          ),
        ],
      ),
    );
  }
}

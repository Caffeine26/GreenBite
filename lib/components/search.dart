import 'package:flutter/material.dart';
import 'popup/search.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Search> {
  void _showSearchPopup() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => const SearchPopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showSearchPopup,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF18542A),
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.search, size: 20, color: Colors.white),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: TextField(
                enabled: false, // Disable direct editing
                decoration: InputDecoration(
                  hintText: 'Search for recipe here',
                  border: InputBorder.none,
                  isCollapsed: true, // Shrinks the text vertically
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

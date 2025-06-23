import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Navigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Light shadow color
            blurRadius: 6,
            offset: Offset(0, -2), // Moves shadow to the top
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor:
            Colors.transparent, // transparent since we use container color
        elevation: 0, // remove default shadow
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Color(0xFF18542A),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_2_outlined),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

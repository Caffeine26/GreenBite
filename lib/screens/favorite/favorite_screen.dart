import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenbite_app/components/navigation.dart';
import 'recipe_list_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int _selectedIndex = 1; // Favorite tab selected

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

  @override
  Widget build(BuildContext context) {
    // Mock data for the recipe list
    final List<Map<String, dynamic>> recipes = [
      {
        'title': 'Fried shrimp cheese sauce',
        'id': '12345',
        'score': 4.5,
        'image': 'assets/images/fried_shrimp.png',
      },
      {
        'title': 'Chicken fruit salad',
        'id': '12345',
        'score': 4.5,
        'image': 'assets/images/chicken_salad.png',
      },
      {
        'title': 'Roasted pork ribs',
        'id': '12345',
        'score': 4.5,
        'image': 'assets/images/pork_ribs.png',
      },
      {
        'title': 'Fried Chicken Cheese',
        'id': '12345',
        'score': 4.5,
        'image': 'assets/images/fried_chicken_cheese.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Navigation(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF18542A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, '/home'),
        ),
        centerTitle: true,
        title: const Text(
          'Favorite',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 16.0),
        //     child: Center(
        //       child: SvgPicture.asset('assets/svg/cookbook.svg', height: 28),
        //     ),
        //   ),
        // ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 16),
          const Text(
            'All recipes',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...recipes.map(
            (recipe) => RecipeListItem(
              title: recipe['title'],
              recipeId: recipe['id'],
              reviewScore: recipe['score'],
              imagePath: recipe['image'],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenbite_app/favorite/recipe_list_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Favorite',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: SvgPicture.asset('assets/svg/cookbook.svg', height: 28),
            ),
          ),
        ],
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

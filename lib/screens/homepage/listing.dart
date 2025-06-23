import 'package:flutter/material.dart';
import 'package:greenbite_app/components/banner.dart';
import 'package:greenbite_app/components/foodcategory.dart';
import 'package:greenbite_app/components/header.dart';
import 'package:greenbite_app/components/search.dart';
import 'package:greenbite_app/components/navigation.dart';
import 'package:greenbite_app/components/recipe_card.dart';
import 'package:greenbite_app/data/recipes.dart';

class Listing extends StatefulWidget {
  const Listing({super.key});

  @override
  State<Listing> createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  int _selectedIndex = 0;

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
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Navigation(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(),
              const AutoBanner(),
              const SizedBox(height: 10),
              const Search(),
              const SizedBox(height: 10),
              const FoodCategory(),
              const SizedBox(height: 10),
              // Dynamically render recipes from recipeList
              ...recipeList.map(
                (recipe) => Product(
                  imageName: recipe['image'].toString().replaceFirst(
                    'assets/images/',
                    '',
                  ),
                  title: recipe['title'],
                  rating: recipe['rating'],
                  category: recipe['category'],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

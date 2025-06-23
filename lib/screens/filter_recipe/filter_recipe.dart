import 'package:flutter/material.dart';
import 'package:greenbite_app/data/recipes.dart';
import 'package:greenbite_app/components/recipe_card.dart';

class FilteredRecipes extends StatelessWidget {
  const FilteredRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final String category =
        ModalRoute.of(context)!.settings.arguments as String;

    // Filter recipes by selected category
    final filtered =
        recipeList.where((recipe) => recipe['category'] == category).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Category: $category')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final recipe = filtered[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: recipe);
            },
            child: Product(
              imageName: recipe['image'],
              title: recipe['title'],
              rating: recipe['rating'],
            ),
          );
        },
      ),
    );
  }
}

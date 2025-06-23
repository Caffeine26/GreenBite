import 'package:flutter/material.dart';

class CookBookPage extends StatefulWidget {
  const CookBookPage({super.key});

  @override
  State<CookBookPage> createState() => _CookBookPageState();
}

class _CookBookPageState extends State<CookBookPage> {
  // List to track favorite status of each recipe
  List<bool> favoriteStatus = List.generate(11, (index) => true);

  // Recipe data
  final List<Map<String, dynamic>> recipes = [
    {
      'title': 'Fried shrimp cheese sauce',
      'recipeId': 'Recipe ID: 10340',
      'review': 4.5,
      'image': 'assets/images/fried_shrimp.png',
    },
    {
      'title': 'Chicken fruit salad',
      'recipeId': 'Recipe ID: 10345',
      'review': 4.5,
      'image': 'assets/images/chicken_salad.png',
    },
    {
      'title': 'Roasted pork ribs',
      'recipeId': 'Recipe ID: 10345',
      'review': 4.5,
      'image': 'assets/images/pork_ribs.png',
    },
    {
      'title': 'Fried Chicken cheese sauce',
      'recipeId': 'Recipe ID: 10345',
      'review': 4.5,
      'image': 'assets/images/fried_chicken_cheese.png',
    },
    {
      'title': 'Beef Steak egg garlic',
      'recipeId': 'Recipe ID: 10345',
      'review': 4.5,
      'image': 'assets/images/Beef_steak_egg_garlic.png',
    },
    {
      'title': 'Healthy salad vegetable',
      'recipeId': 'Recipe ID: 10345',
      'review': 4.5,
      'image': 'assets/images/Healthy_salad_vegetable.png',
    },
    {
      'title': 'Fruit salad boil egg',
      'recipeId': 'Recipe ID: 10345',
      'review': 4.5,
      'image': 'assets/images/Fruit_salad_boil_egg.png',
    },
    {
      'title': 'Fried shrimp with chili sauce',
      'recipeId': 'Recipe ID: 10345',
      'review': 4.5,
      'image': 'assets/images/Fried_shrimp_with_chili.png',
    },
    {
      'title': 'Salmon tomato noodle',
      'recipeId': 'Recipe ID: 10345',
      'review': 4.5,
      'image': 'assets/images/Salmon_tomato_noodle.png',
    },
    {
      'title': 'Steak potato and tomato',
      'recipeId': 'Recipe ID: 10345',
      'review': 4.5,
      'image': 'assets/images/Steak_potato_and_tomato.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Cookbooks',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child:Text(
              'List of save recipes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      // Recipe Image
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            recipes[index]['image'],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.orange.shade200,
                                      Colors.orange.shade400,
                                    ],
                                  ),
                                ),
                                child: const Icon(
                                  Icons.restaurant,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      
                      // Recipe Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipes[index]['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              recipes[index]['recipeId'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Text(
                                  'Review ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                Text(
                                  ' ${recipes[index]['review']}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      // Favorite Heart Icon
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            favoriteStatus[index] = !favoriteStatus[index];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            favoriteStatus[index] 
                                ? Icons.favorite 
                                : Icons.favorite_border,
                            color: favoriteStatus[index] 
                                ? Color(0xFF17542A) 
                                : Colors.grey[400],
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
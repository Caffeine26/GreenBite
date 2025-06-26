import 'package:flutter/material.dart';
import '../main.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCategory('assets/images/on_trend.jpg', 'On Trend'),
        _buildCategory('assets/images/vegetable.jpg', 'Vegetarian'),
        _buildCategory('assets/images/meat.jpg', 'Meat'),
        _buildCategory('assets/images/fast_food.jpg', 'Fast Food'),
      ],
    );
  }

  Widget _buildCategory(String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          navigatorKey.currentContext!,
          '/filtered',
          arguments: label,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15),
          Image.asset(imagePath, width: 50, height: 50),
          // SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 15)),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

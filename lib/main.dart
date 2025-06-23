import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbite_app/screens/detail_page/recipe_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenBite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: const Color(0xFF18542A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF18542A),
          primary: const Color(0xFF18542A),
        ),
        useMaterial3: true, // Add this for Material 3 design
      ),
      initialRoute: '/test-recipe-detail',
      routes: {
        '/test-recipe-detail': (context) => const RecipeDetail(recipeId: 'test-recipe'), // Add required recipeId
      },
    );
  }
}
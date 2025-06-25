import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import the generated Firebase options

import 'package:google_fonts/google_fonts.dart';
import 'package:greenbite_app/screens/CookBook.dart';
import 'package:greenbite_app/screens/PrivacyPolicy/privacy_policy.dart';
import 'package:greenbite_app/screens/accounts/AccountPage.dart';
import 'package:greenbite_app/screens/community/CommunityPage.dart';
import 'package:greenbite_app/screens/favorite/favorite_screen.dart';
import 'package:greenbite_app/screens/filter_recipe/filter_recipe.dart';
import 'package:greenbite_app/screens/rewards/rewards_screen.dart';
import 'package:greenbite_app/screens/setting_pages/settings_screen.dart';
import 'package:greenbite_app/screens/detail_page/recipe_detail.dart';

// Pages
import 'package:greenbite_app/screens/splash_screen/splash_sreen.dart';
import 'package:greenbite_app/screens/homepage/listing.dart';
import 'package:greenbite_app/screens/about_us/about_us.dart';
import 'package:greenbite_app/screens/accounts/edit_profile_info.dart';
import 'package:greenbite_app/screens/uploading_step/step1.dart';
import 'package:greenbite_app/screens/uploading_step/step2.dart';
import 'package:greenbite_app/screens/uploading_step/step3.dart';
import 'package:greenbite_app/screens/login_and_register/register_screen.dart';
import 'package:greenbite_app/screens/login_and_register/signin_screen.dart';

// Navigation key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // Use Firebase options here
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'GreenBite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: const Color(0xFF18542A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF18542A),
          primary: const Color(0xFF18542A),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FlushScreen(),
        '/home': (context) => const Listing(),
        '/about': (context) => const AboutUsPage(),
        '/account': (context) => const AccountPage(),
        '/account-edit': (context) => const EditProfileInfo(),
        '/setting': (context) => const SettingsPage(),
        '/filtered': (context) => const FilteredRecipes(),
        '/upload': (context) => const AddPhotoPage(),
        '/upload-step2': (context) => const AddIngredientPage(),
        '/upload-progress': (context) => const UploadProgressPage(),
        '/recipe-detail':
            (context) => const RecipeDetail(recipeId: 'test-recipe'),

        // Auth Screens
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const SignInScreen(),

        '/score': (context) => const RewardsScreen(),

        // Waiting for pages
        // '/favorite': (context) => const FavoritePage(),
        // '/community': (context) => const CommunityPage(),
        /**
         * Waiting for pages to route
         */
        '/favorite': (context) => const FavoriteScreen(),
        '/cookbook': (context) => const CookBookPage(),
        '/score-page': (context) => const RewardsScreen(),
        '/privacy': (context) => const PrivacyPolicyPage(),
        '/community': (context) => const CommunityPage(),
      },
    );
  }
}

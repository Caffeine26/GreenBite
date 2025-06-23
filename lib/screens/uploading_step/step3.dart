import 'dart:async';
import 'package:flutter/material.dart';
import 'package:greenbite_app/data/recipes.dart'; // import your shared recipeList

class UploadProgressPage extends StatefulWidget {
  const UploadProgressPage({super.key});

  @override
  State<UploadProgressPage> createState() => _UploadProgressPageState();
}

class _UploadProgressPageState extends State<UploadProgressPage> {
  double progress = 0.0;
  late Map<String, dynamic> recipeData;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (progress >= 1.0) {
        timer.cancel();

        // Save to shared recipe list
        recipeList.add(recipeData);

        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        });
      } else {
        setState(() {
          progress += 0.1;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    recipeData =
        (ModalRoute.of(context)!.settings.arguments as Map)
            .cast<String, dynamic>();
  }

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 91).toInt();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Uploading your recipe...",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              CircularProgressIndicator(
                value: progress,
                strokeWidth: 6,
                backgroundColor: Colors.grey[300],
                color: Color(0xFF18542A),
              ),
              const SizedBox(height: 20),
              Text("$percent%", style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

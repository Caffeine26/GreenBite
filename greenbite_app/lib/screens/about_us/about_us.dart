import 'package:flutter/material.dart';
import 'footer.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFFDDF5EA),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero image with rounded corners
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/aboutus.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main description
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        height: 1.4,
                      ),
                      children: [
                        TextSpan(
                          text: 'GreenBites',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF17542A),
                          ),
                        ),
                        TextSpan(
                          text: ' is a community-driven mobile application designed to combat food waste by helping users find creative and sustainable ways to use leftover ingredients. Our mission is to empower people to reduce food waste while fostering a community that shares ideas, recipes, and support.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Our Vision Section
                  const Text(
                    'Our Vision',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'We envision a world where food is used efficiently and sustainably, minimizing waste and promoting conscious consumption.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Our Mission Section
                  const Text(
                    'Our Mission',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'To provide an easy-to-use platform that connects individuals passionate about sustainability and food waste management, offering tools to discover new recipes, share creative ideas, and participate in a community that values resourcefulness.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Why Choose GreenBites Section
                  const Text(
                    'Why Choose GreenBites?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Bullet points
                  const BulletPoint(
                    text: 'Discover innovative recipes to make the most of your leftovers.',
                  ),
                  const SizedBox(height: 6),
                  const BulletPoint(
                    text: 'Connect with a community that shares your passion for reducing food waste.',
                  ),
                  const SizedBox(height: 6),
                  const BulletPoint(
                    text: 'Access helpful tips, articles, and community stories to stay inspired.',
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Call to action
                  const Text(
                    'Join us on our journey to make every bite count!',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF17542A),
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
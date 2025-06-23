import 'package:flutter/material.dart';
import '../about_us/footer.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFDDF5EA),
        elevation: 0,
        toolbarHeight: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Introduction
                  const Text(
                    'Welcome to GreenBites! Your privacy is important to us, and we are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data when you use the GreenBites mobile application.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Section 1
                  const Text(
                    '1. Information We Collect',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'We collect the following types of information to provide and improve our services:',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Subsection a
                  const Text(
                    'a. Personal Information',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Name, email address, and other contact details when you register an account.'),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Profile information such as profile picture, bio, and preferences.'),
                  const SizedBox(height: 12),
                  
                  // Subsection b
                  const Text(
                    'b. Usage Data',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Device information (e.g., device type, operating system).'),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Log data including IP address, app version, and access timestamps.'),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Interaction data, such as features used and pages viewed.'),
                  const SizedBox(height: 12),
                  
                  // Subsection c
                  const Text(
                    'c. Location Data',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'With your permission, we may collect your location to improve service relevance.'),
                  const SizedBox(height: 12),
                  
                  // Subsection d
                  const Text(
                    'd. Cookies and Similar Technologies',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'We use cookies and similar technologies to enhance your experience and track usage patterns.'),
                  const SizedBox(height: 20),
                  
                  // Section 2
                  const Text(
                    '2. How We Use Your Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'We use your data to:',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const BulletPoint(text: 'Provide and maintain the GreenBites app.'),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Personalize your experience by suggesting recipes and community content.'),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Communicate updates, news, and notifications.'),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Monitor usage and troubleshoot issues.'),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Enhance security and detect fraud.'),
                  const SizedBox(height: 20),
                  
                  // Section 3
                  const Text(
                    '3. Sharing Your Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'We do not sell or rent your personal information to third parties. We may share data with trusted partners only when necessary to provide services, comply with legal obligations, or protect our rights.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Section 4
                  const Text(
                    '4. Data Security',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'We implement robust security measures to protect your data from unauthorized access, alteration, or disclosure. However, no method of transmission over the internet is entirely secure.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Section 5
                  const Text(
                    '5. Your Data Rights',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'You have the right to:',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const BulletPoint(text: 'Access and update your information.'),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Request data deletion.'),
                  const SizedBox(height: 4),
                  const BulletPoint(text: 'Withdraw consent for data collection.'),
                  const SizedBox(height: 20),
                  
                  // Section 6
                  const Text(
                    '6. Third-Party Services',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'GreenBites may include links to third-party services. We are not responsible for the privacy practices of these services and recommend reviewing their policies.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Section 7
                  const Text(
                    '7. Changes to This Privacy Policy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'We may update this policy periodically. The revised version will be effective upon posting. Your continued use of the app after changes constitutes acceptance.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Section 8
                  const Text(
                    '8. Contact Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17542A),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'If you have questions or concerns about this Privacy Policy, please contact us at [Insert Contact Information].',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Final statement
                  const Text(
                    'By using GreenBites, you agree to the collection and use of your information as described in this policy.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),
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
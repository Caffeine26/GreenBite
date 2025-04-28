import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbite_app/screens/login_and_register/signin_screen.dart';
import 'package:greenbite_app/screens/login_and_register/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Green background
          Container(
            color: const Color(0xFF18542A), // Dark green background
          ),
          
          // Logo centered in the upper portion
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/splash_bg.png', // Make sure to add this to your assets
                width: 200,
                height: 200,
              ),
            ),
          ),
          
          // White bottom card with welcome text and buttons
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            // top: 10,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome text
                    Text(
                      'Welcome!',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Tagline
                    Text(
                      '"Cook delicious meals while reducing waste and helping the planet."',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    
                    const Spacer(),
                    
                    // Buttons row
                    Row(
                      children: [
                        // Sign In Button
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              side: const BorderSide(color: Color(0xFF18542A)),
                            ),
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 16),
                        
                        // Register Now Button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF18542A),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Register Now',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16), // Added spacing at the bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
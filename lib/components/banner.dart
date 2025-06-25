import 'dart:async';
import 'package:flutter/material.dart';

class AutoBanner extends StatefulWidget {
  const AutoBanner({super.key});

  @override
  State<AutoBanner> createState() => _AutoBannerState();
}

class _AutoBannerState extends State<AutoBanner> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> _banners = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
  ];

  @override
  void initState() {
    super.initState();

    // Auto-scroll every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_controller.hasClients) {
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleBannerTap(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/about');
    } else if (index == 1) {
      //will be input later
      Navigator.pushNamed(context, '/score-page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        height: 120,
        child: PageView.builder(
          controller: _controller,
          itemCount: _banners.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _handleBannerTap(index),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  _banners[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

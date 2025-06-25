import 'package:flutter/material.dart';

class NotificationPopup extends StatelessWidget {
  const NotificationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 320,
        constraints: const BoxConstraints(maxHeight: 400),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            // Notification items
            _buildNotificationItem(
              imagePath: 'assets/images/stress.jpg', // Your cat image
              title: 'Caffeine26',
              subtitle: 'just posted a new recipe.',
              onTap: () {
                Navigator.pop(context);
              },
              isBold: true,
            ),
            _buildNotificationItem(
              imagePath: 'assets/images/coin.png', // Your star badge image
              title: 'Congrats! You have earned ',
              subtitle: '1 more point!',
              onTap: () {
                Navigator.pop(context);
              },
              isBoldSubtitle: true,
            ),
            _buildNotificationItem(
              imagePath: 'assets/images/splash_bg.png', // Your GreenBite logo
              title: 'Welcome back! ',
              subtitle: 'KiKi.',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // Footer
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'No other notifications',
                style: TextStyle(fontSize: 14, color: Colors.grey[500]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    String? imagePath,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isBold = false,
    bool isBoldSubtitle = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar/Image
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child:
                  imagePath != null
                      ? ClipOval(
                        child: Image.asset(
                          imagePath,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      )
                      : const SizedBox.shrink(),
            ),
            const SizedBox(width: 12),

            // Text content vertically centered to image
            Expanded(
              child: Container(
                height: 48,
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              isBold ? FontWeight.w600 : FontWeight.normal,
                          color: Colors.black87,
                        ),
                      ),
                      TextSpan(
                        text: subtitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              isBoldSubtitle
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

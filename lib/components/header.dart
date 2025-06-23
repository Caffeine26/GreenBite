import 'package:flutter/material.dart';
import 'package:greenbite_app/components/popup/menu.dart';
import 'package:greenbite_app/components/popup/notification.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome, KiKi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Your scores: 168',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              // Make the star icon clickable
              SizedBox(
                width: 25,
                height: 25,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFED766),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.orange,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.pushNamed(context, '/score');
                    },
                  ),
                ),
              ),

              const SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black38,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 70, right: 16),
                          child: NotificationPopup(),
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black38,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 70, right: 16),
                          child: MenuPopup(),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

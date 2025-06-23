import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenbite_app/rewards/exchange_prize_screen.dart';
import 'package:greenbite_app/rewards/history_post_item.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAF7ED),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Green Bites Rewards',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Scores
          const Text('Your scores', style: TextStyle(fontSize: 18)),
          Row(
            children: const [
              Icon(Icons.stars, color: Colors.amber, size: 32),
              SizedBox(width: 8),
              Text(
                '168',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Rewards Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
            children: const [
              RewardCard(
                label: 'Note book',
                points: 10,
                color: Color(0xFFF6FFD7),
              ),
              RewardCard(
                label: 'Tote bag',
                points: 20,
                color: Color(0xFFD7BFA6),
              ),
              RewardCard(label: 'Caps', points: 30, color: Color(0xFFBFE2FF)),
              RewardCard(label: 'Bottle', points: 40, color: Color(0xFFBFFFD7)),
            ],
          ),
          const SizedBox(height: 3),
          // Exchange Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF18542A),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExchangePrizeScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/svg/gift.svg',
                    color: Colors.white,
                    height: 24,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Exchange your prize',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Divider(thickness: 1, color: Color(0xFFE0E0E0)),
          SizedBox(height: 16),
          Center(
            child: Text(
              'History of Posting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 16),
          // History List Example
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HistoryDateHeader('03 MARCH 2025'),
              const HistoryPostItem(
                imagePath: 'assets/images/steak.png',
                title: 'Steak',
                time: '4:30 PM',
                points: 10,
              ),
              _HistoryDateHeader('01 MARCH 2025'),
              const HistoryPostItem(
                imagePath: 'assets/images/fried_chicken.png',
                title: 'Fried Chicken',
                time: '4:30 PM',
                points: 10,
              ),
              _HistoryDateHeader('27 FEBRUARY 2025'),
              const HistoryPostItem(
                imagePath: 'assets/images/grilled_chicken.png',
                title: 'Grilled Chicken',
                time: '4:30 PM',
                points: 10,
              ),
              _HistoryDateHeader('16 FEBRUARY 2025'),
              const HistoryPostItem(
                imagePath: 'assets/images/vegetable_stir_fry.png',
                title: 'Vegetable Stir Fry',
                time: '4:30 PM',
                points: 10,
              ),
              _HistoryDateHeader('07 FEBRUARY 2025'),
              const HistoryPostItem(
                imagePath: 'assets/images/potato_pancakes.png',
                title: 'Potato Pancakes',
                time: '4:30 PM',
                points: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RewardCard extends StatefulWidget {
  final String label;
  final int points;
  final Color color;

  const RewardCard({
    Key? key,
    required this.label,
    required this.points,
    required this.color,
  }) : super(key: key);

  @override
  State<RewardCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<RewardCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutBack,
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Change to get\n${widget.label}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.stars, color: Colors.amber.shade700, size: 28),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.points}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper widget for date headers
class _HistoryDateHeader extends StatelessWidget {
  final String date;
  const _HistoryDateHeader(this.date);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 8, left: 4),
      child: Text(
        date,
        style: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.bold,
          fontSize: 15,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

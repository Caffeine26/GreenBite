import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF7ED),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  RewardCard(label: 'Note book', points: 10, color: Color(0xFFFFF9C4)),
                  RewardCard(label: 'Tote bag', points: 20, color: Color(0xFFD7CCC8)),
                  RewardCard(label: 'Caps', points: 30, color: Color(0xFFBBDEFB)),
                  RewardCard(label: 'Bottle', points: 40, color: Color(0xFFC8E6C9)),
                ],
              ),
              const SizedBox(height: 24),
              // Exchange Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.card_giftcard),
                  label: const Text('Exchange your prize'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF18542A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 24),
              // History
              const Text(
                'History of Posting',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // ... Add your history list here ...
            ],
          ),
        ),
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
            borderRadius: BorderRadius.circular(16),
            boxShadow: _hovering
                ? [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ]
                : [],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Change to get\n${widget.label}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.stars, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${widget.points}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
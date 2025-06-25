import 'package:flutter/material.dart';
import 'package:greenbite_app/components/navigation.dart';
import 'package:greenbite_app/components/review_item.dart';
import 'package:share_plus/share_plus.dart';

class RecipeDetail extends StatefulWidget {
  final String recipeId;

  const RecipeDetail({super.key, required this.recipeId});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _currentIndex = 0;
  bool isFavorited = false;
  final ScrollController _scrollController = ScrollController();
  final cookbooksKey = GlobalKey();
  final groceryKey = GlobalKey();
  final favoriteKey = GlobalKey();

  // Review state
  final TextEditingController _reviewController = TextEditingController();
  double _newReviewRating = 0.0;
  bool _showReviewForm = false;
  final List<Map<String, dynamic>> _reviews = [
    {
      'author': 'Sarawat Jae',
      'reviewCount': '12',
      'photoCount': '22',
      'rating': 5.0,
      'timeAgo': '3 years ago',
      'comment': 'good , the test is unexpected......',
    },
    {
      'author': 'John Doe',
      'reviewCount': '5',
      'photoCount': '8',
      'rating': 4.0,
      'timeAgo': '2 months ago',
      'comment': 'Great recipe! Tasted amazing.',
    },
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0)
      _scrollToSection(cookbooksKey);
    else if (index == 1)
      _scrollToSection(groceryKey);
    else if (index == 2)
      _scrollToSection(favoriteKey);
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0,
      );
    }
  }

  void _showShareDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Share on',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildShareOption(Icons.facebook, 'Facebook'),
                  _buildShareOption(Icons.telegram, 'Telegram'),
                  _buildShareOption(Icons.camera_alt, 'Instagram'),
                  _buildShareOption(Icons.alternate_email, 'X (Twitter)'),
                  _buildShareOption(Icons.message, 'Threads'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShareOption(IconData icon, String platform) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF18542A)),
      title: Text(platform),
      onTap: () {
        Navigator.of(context).pop();
        Share.share('Check out this recipe on GreenBite!');
      },
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildReviewSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reviews',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              _calculateAverageRating().toStringAsFixed(1),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF18542A),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRatingStars(_calculateAverageRating()),
                const SizedBox(height: 4),
                Text(
                  '${_reviews.length} reviews',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),

        ElevatedButton(
          onPressed: () => setState(() => _showReviewForm = !_showReviewForm),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF18542A),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
          ),
          child: Text(_showReviewForm ? 'Cancel' : 'Write a review'),
        ),

        if (_showReviewForm) ...[
          const SizedBox(height: 16),
          Column(
            children: [
              Text(
                'Your Rating',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildEditableRatingStars(_newReviewRating),
                  const SizedBox(width: 8),
                  Text(_newReviewRating.toStringAsFixed(1)),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _reviewController,
                decoration: InputDecoration(
                  hintText: 'Write your review...',
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(12),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _addNewReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF18542A),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Submit Review'),
              ),
              const SizedBox(height: 16),
              const Divider(),
            ],
          ),
        ],

        ..._reviews.map(
          (review) => ReviewItem(
            author: review['author'],
            reviewCount: review['reviewCount'],
            photoCount: review['photoCount'],
            rating: review['rating'],
            timeAgo: review['timeAgo'],
            comment: review['comment'],
            isLastItem: _reviews.last == review,
          ),
        ),
      ],
    );
  }

  double _calculateAverageRating() {
    if (_reviews.isEmpty) return 0;
    return _reviews.map((r) => r['rating']).reduce((a, b) => a + b) /
        _reviews.length;
  }

  void _addNewReview() {
    if (_reviewController.text.isEmpty || _newReviewRating == 0) return;

    setState(() {
      _reviews.insert(0, {
        'author': 'You',
        'reviewCount': '1',
        'photoCount': '0',
        'rating': _newReviewRating,
        'timeAgo': 'Just now',
        'comment': _reviewController.text,
      });
      _reviewController.clear();
      _newReviewRating = 0;
      _showReviewForm = false;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Review submitted!')));
  }

  Widget _buildEditableRatingStars(double rating) {
    return Row(
      children: List.generate(
        5,
        (index) => GestureDetector(
          onTap: () => setState(() => _newReviewRating = index + 1.0),
          child: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 32,
          ),
        ),
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rating.floor()
              ? Icons.star
              : index == rating.floor() && rating % 1 >= 0.5
              ? Icons.star_half
              : Icons.star_border,
          color: Colors.amber,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildCircleIconButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xFF18542A),
            child: Icon(icon, size: 28, color: iconColor ?? Colors.white),
          ),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Recipe Detail'),
        backgroundColor: Color(0xFF18542A),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        // actions: [
        //   IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        // ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/dumpling.jpg',
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCircleIconButton(
                      icon: Icons.book,
                      label: 'Cookbooks',
                      onTap: () => _scrollToSection(cookbooksKey),
                    ),
                    _buildCircleIconButton(
                      icon: Icons.shopping_cart,
                      label: 'Grocery',
                      onTap: () => _scrollToSection(groceryKey),
                    ),
                    _buildCircleIconButton(
                      icon:
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                      label: 'Favorite',
                      iconColor: isFavorited ? Colors.red : null,
                      onTap:
                          () => setState(() {
                            isFavorited = !isFavorited;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  isFavorited
                                      ? 'Added to favorites'
                                      : 'Removed from favorites',
                                ),
                              ),
                            );
                          }),
                    ),
                    _buildCircleIconButton(
                      icon: Icons.share,
                      label: 'Share',
                      onTap: _showShareDialog,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Paleo Grilled Chicken',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'by Caffeine26',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),

                // Cookbooks Section
                Container(
                  key: cookbooksKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cookbooks',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('Explore various cookbooks and recipes.'),
                      const SizedBox(height: 24),
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildIngredientList(),
                      const SizedBox(height: 24),
                      const Text(
                        'Method',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildSteps(),
                      const SizedBox(height: 24),
                      _buildEquipmentList(),
                    ],
                  ),
                ),

                // Grocery Section
                Container(
                  key: groceryKey,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(height: 40),
                      Text(
                        'Grocery',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Add ingredients to your grocery list.'),
                    ],
                  ),
                ),

                // Favorite Section
                Container(
                  key: favoriteKey,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(height: 40),
                      Text(
                        'Favorite',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Your favorite recipes saved in one place.'),
                    ],
                  ),
                ),

                // Reviews Section
                _buildReviewSummary(),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navigation(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildIngredientList() {
    const ingredients = [
      '4 medium chicken breasts',
      '8 cups mixed greens',
      '1 large avocado sliced',
      '1 cup cherry tomatoes',
      '1 lemon',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredients.map((item) => Text('• $item')).toList(),
    );
  }

  Widget _buildSteps() {
    const steps = [
      'Heat up vegetable oil in a pan on medium heat.',
      'Add chicken breasts and cook for 5-7 minutes per side.',
      'Prepare the salad with greens, avocado, and tomatoes.',
      'Slice cooked chicken and serve over salad.',
      'Squeeze lemon juice over the top before serving.',
    ];
    return Column(
      children:
          steps.asMap().entries.map((entry) {
            final index = entry.key + 1;
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey[300]!,
                ), // Using ! operator
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFF18542A),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$index',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(child: Text(entry.value)),
                ],
              ),
            );
          }).toList(),
    );
  }

  Widget _buildEquipmentList() {
    const items = [
      'Grill Pan',
      'Mixing Bowls',
      'Chef\'s Knife',
      'Cutting Board',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 40),
        const Text(
          'EQUIPMENT',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Row(
            children: [
              const Icon(Icons.check, size: 18, color: Color(0xFF18542A)),
              const SizedBox(width: 8),
              Expanded(child: Text(item)),
            ],
          ),
        ),
      ],
    );
  }
}

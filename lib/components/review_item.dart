import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final String author;
  final String reviewCount;
  final String photoCount;
  final double rating;
  final String timeAgo;
  final String comment;
  final bool isLastItem;

  const ReviewItem({
    super.key,
    required this.author,
    required this.reviewCount,
    required this.photoCount,
    required this.rating,
    required this.timeAgo,
    required this.comment,
    this.isLastItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, color: Colors.grey),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(author, 
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          )
                        ),
                        const SizedBox(width: 4),
                        Text(timeAgo, 
                          style: TextStyle(
                            color: Colors.grey[600], 
                            fontSize: 12
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text('$reviewCount reviews · $photoCount photos',
                        style: TextStyle(
                          color: Colors.grey[600], 
                          fontSize: 12
                        )
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildRatingStars(rating),
                        const SizedBox(width: 8),
                        Text(rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(comment,
                      style: const TextStyle(
                        fontSize: 14
                      )
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(50, 30),
                          ),
                          child: const Text('Like',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12
                            )
                          ),
                        ),
                        const SizedBox(width: 16),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(50, 30),
                          ),
                          child: const Text('Reply',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!isLastItem) const Divider(height: 1),
      ],
    );
  }

  Widget _buildRatingStars(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return const Icon(Icons.star, 
            color: Colors.amber, 
            size: 16
          );
        } else if (index == rating.floor() && rating % 1 >= 0.5) {
          return const Icon(Icons.star_half, 
            color: Colors.amber, 
            size: 16
          );
        } else {
          return const Icon(Icons.star_border, 
            color: Colors.amber, 
            size: 16
          );
        }
      }),
    );
  }
}
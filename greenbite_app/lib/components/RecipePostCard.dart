import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';

class RecipePostCard extends StatefulWidget {
  final String username;
  final String date;
  final String description;
  final Uint8List? imageBytes; // For web/mobile compatibility
  final String? imageUrl; // Optional fallback
  final File? imageFile; // New: For image picked from file
  final int likes;
  final void Function()? onLike;
  final void Function(String text)? onComment;

  const RecipePostCard({
    super.key,
    required this.username,
    required this.date,
    required this.description,
    this.imageBytes,
    this.imageUrl,
    this.imageFile,
    this.likes = 0,
    this.onLike,
    this.onComment,
  });

  @override
  State<RecipePostCard> createState() => _RecipePostCardState();
}

class _RecipePostCardState extends State<RecipePostCard> {
  late int _likes;

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
  }

  void _incrementLikes() {
    setState(() {
      _likes++;
    });
    widget.onLike?.call(); // notify parent if provided
  }

  Widget _buildImage() {
    const double imageHeight = 200;
    if (widget.imageBytes != null) {
      return _styledImage(Image.memory(widget.imageBytes!, fit: BoxFit.cover, width: double.infinity, height: imageHeight));
    } else if (widget.imageFile != null) {
      return _styledImage(Image.file(widget.imageFile!, fit: BoxFit.cover, width: double.infinity, height: imageHeight));
    } else if (widget.imageUrl != null) {
      return _styledImage(Image.asset(widget.imageUrl!, fit: BoxFit.cover, width: double.infinity, height: imageHeight));
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _styledImage(Image imageWidget) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: imageWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            title: Text(widget.username),
            subtitle: Text(widget.date),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.description,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          _buildImage(),
          const SizedBox(height: 8),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: _incrementLikes,
                  child: Row(
                    children: [
                      const Icon(Icons.thumb_up_alt_outlined, size: 20),
                      const SizedBox(width: 4),
                      Text(_likes.toString()),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.comment_outlined, size: 20),
                    SizedBox(width: 4),
                    Text("Comment"),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.share_outlined, size: 20),
                    SizedBox(width: 4),
                    Text("Share"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

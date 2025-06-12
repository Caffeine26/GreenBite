import 'dart:io';
import 'package:flutter/material.dart';

class RecipePostCard extends StatefulWidget {
  final String username;
  final String date;
  final String description;
  final File? imageFile;
  final String? imageUrl;
  final int likes;

  const RecipePostCard({
    super.key,
    required this.username,
    required this.date,
    required this.description,
    this.imageFile,
    this.imageUrl,
    this.likes = 0,
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          if (widget.imageFile != null)
            Image.file(widget.imageFile!)
          else if (widget.imageUrl != null)
            Image.asset(widget.imageUrl!, fit: BoxFit.cover),
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

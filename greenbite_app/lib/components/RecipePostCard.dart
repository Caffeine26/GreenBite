import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'SharePopup.dart';

class RecipePostCard extends StatefulWidget {
  final String username;
  final String date;
  final String description;
  final Uint8List? imageBytes;
  final String? imageUrl;
  final int likes;
  final void Function()? onLike;
  final void Function(String text)? onComment;
  final void Function() onShare;
  final List<Map<String, String>>? comments;

  const RecipePostCard({
    super.key,
    required this.username,
    required this.date,
    required this.description,
    this.imageBytes,
    this.imageUrl,
    this.likes = 0,
    this.onLike,
    this.onComment,
    required this.onShare,
    this.comments,
  });

  @override
  State<RecipePostCard> createState() => _RecipePostCardState();
}

class _RecipePostCardState extends State<RecipePostCard> {
  late int _likes;
  bool _showCommentInput = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
  }

  void _incrementLikes() {
    setState(() {
      _likes++;
    });
    widget.onLike?.call();
  }

  void _submitComment() {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      widget.onComment?.call(text);
      _commentController.clear();
    }
  }

  Widget _buildImage() {
    const double imageHeight = 200;

    if (widget.imageBytes != null) {
      return _styledImage(
        Image.memory(
          widget.imageBytes!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: imageHeight,
        ),
      );
    } else if (widget.imageUrl != null) {
      return _styledImage(
        Image.asset(
          widget.imageUrl!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: imageHeight,
        ),
      );
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showCommentInput = !_showCommentInput;
                    });
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.comment_outlined, size: 20),
                      SizedBox(width: 4),
                      Text("Comment"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: widget.onShare,
                  child: Row(
                    children: const [
                      Icon(Icons.share_outlined, size: 20),
                      SizedBox(width: 4),
                      Text("Share"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_showCommentInput) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      onSubmitted: (_) => _submitComment(),
                      decoration: InputDecoration(
                        hintText: "Comment as KiKi",
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _submitComment,
                    icon: const Icon(Icons.send, color: Colors.green),
                  ),
                ],
              ),
            ),
            ...?widget.comments?.map((comment) {
              return Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comment['user'] ?? 'Unknown',
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            Text(comment['text'] ?? ''),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 12),
          ]
        ],
      ),
    );
  }
}

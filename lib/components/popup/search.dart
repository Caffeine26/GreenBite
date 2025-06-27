import 'package:flutter/material.dart';


class SearchPopup extends StatefulWidget {
  const SearchPopup({super.key});

  @override
  State<SearchPopup> createState() => _SearchPopupState();
}

class _SearchPopupState extends State<SearchPopup> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Auto-focus the search field when popup opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  // Search Input
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: 'What recipes are you searching for?',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      onSubmitted: (value) {
                        // Handle search submission
                        _performSearch(value);
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Search Icon
                  GestureDetector(
                    onTap: () {
                      _performSearch(_searchController.text);
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[600],
                      size: 24,
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Close Icon
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close, color: Colors.grey[600], size: 24),
                  ),
                ],
              ),
            ),

            // Divider
            Divider(height: 1, color: Colors.grey[300]),

            // Search Results Area (you can customize this)
            Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child:
                  _searchController.text.isEmpty
                      ? _buildEmptyState()
                      : _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Icon(
      //       Icons.search,
      //       size: 48,
      //       color: Colors.grey[400],
      //     ),
      //     const SizedBox(height: 16),
      //     Text(
      //       'Start typing to search for recipes',
      //       style: TextStyle(
      //         color: Colors.grey[500],
      //         fontSize: 16,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildSearchResults() {
    return ListView(
      children: [
        // Add your search results here
        Text(
          'Search results for "${_searchController.text}"',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        // Add actual search result items here
      ],
    );
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) return;

    setState(() {
      // Trigger search results update
    });

    // Handle search logic here
    // print('Searching for: $query');

    // You can add navigation or other search actions here
    // Navigator.pop(context);
    // Navigator.pushNamed(context, '/search-results', arguments: query);
  }
}

// Example usage in your app
class SearchPopupExample extends StatelessWidget {
  const SearchPopupExample({super.key});

  void _showSearchPopup(BuildContext context) {
    showDialog(
      context: context,
      // ignore: deprecated_member_use
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => const SearchPopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchPopup(context),
          ),
        ],
      ),
      body: const Center(
        child: Text('Tap the search icon to open search popup'),
      ),
    );
  }
}

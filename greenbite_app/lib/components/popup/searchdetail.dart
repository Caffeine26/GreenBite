// import 'package:flutter/material.dart';

// class SearchDetailPopup extends StatefulWidget {
//   const SearchDetailPopup({super.key});

//   @override
//   _SearchDetailPopupState createState() => _SearchDetailPopupState();
// }

// class _SearchDetailPopupState extends State<SearchDetailPopup> {
//   final TextEditingController _searchController = TextEditingController();

//   final List<MenuItem> menuItems = [
//     MenuItem(
//       name: 'Steak salad',
//       description: 'Beef, shrimp, tomato',
//       rating: 4.5,
//       image: 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=300&h=200&fit=crop',
//     ),
//     MenuItem(
//       name: 'Steak salad',
//       description: 'Beef, shrimp, tomato',
//       rating: 4.5,
//       image: 'https://images.unsplash.com/photo-1558030006-450675393462?w=300&h=200&fit=crop',
//     ),
//     MenuItem(
//       name: 'Steak potato',
//       description: 'Beef, shrimp, potato',
//       rating: 4.5,
//       image: 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=300&h=200&fit=crop',
//     ),
//     MenuItem(
//       name: 'Steak potato',
//       description: 'Beef, shrimp, potato',
//       rating: 4.6,
//       image: 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=300&h=200&fit=crop',
//     ),
//     MenuItem(
//       name: 'Steak tomato',
//       description: 'Beef, shrimp, tomato',
//       rating: 4.5,
//       image: 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=300&h=200&fit=crop',
//     ),
//     MenuItem(
//       name: 'Steak tomato',
//       description: 'Beef, shrimp, tomato',
//       rating: 4.5,
//       image: 'https://images.unsplash.com/photo-1558030006-450675393462?w=300&h=200&fit=crop',
//     ),
//     MenuItem(
//       name: 'Steak tomato',
//       description: 'Beef, shrimp, tomato',
//       rating: 4.5,
//       image: 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=300&h=200&fit=crop',
//     ),
//     MenuItem(
//       name: 'Steak tomato',
//       description: 'Beef, shrimp, tomato',
//       rating: 4.5,
//       image: 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=300&h=200&fit=crop',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.9,
//       minChildSize: 0.7,
//       maxChildSize: 0.95,
//       builder: (context, scrollController) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           child: Column(
//             children: [
//               // Search Header
//               Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: Container(
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Icon(Icons.arrow_back, size: 20),
//                       ),
//                     ),
//                     SizedBox(width: 12),
//                     Expanded(
//                       child: Container(
//                         height: 42,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: TextField(
//                           controller: _searchController,
//                           decoration: InputDecoration(
//                             hintText: 'Steak',
//                             prefixIcon: Icon(Icons.search, color: Colors.grey),
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.only(top: 10),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Grid content
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: GridView.builder(
//                     controller: scrollController,
//                     itemCount: menuItems.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.72,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                     ),
//                     itemBuilder: (context, index) {
//                       return MenuItemCard(item: menuItems[index]);
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class MenuItemCard extends StatefulWidget {
//   final MenuItem item;

//   const MenuItemCard({super.key, required this.item});

//   @override
//   State<MenuItemCard> createState() => _MenuItemCardState();
// }

// class _MenuItemCardState extends State<MenuItemCard> {
//   bool isFavorite = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             // ignore: deprecated_member_use
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           )
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image section
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//             child: Stack(
//               children: [
//                 Image.network(
//                   widget.item.image,
//                   height: 120,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isFavorite = !isFavorite;
//                       });
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 4,
//                           ),
//                         ],
//                       ),
//                       child: Icon(
//                         isFavorite ? Icons.favorite : Icons.favorite_border,
//                         color: isFavorite ? Colors.red : Colors.grey,
//                         size: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Info section
//           Padding(
//             padding: EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.item.name,
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   widget.item.description,
//                   style: TextStyle(color: Colors.grey[600], fontSize: 12),
//                 ),
//                 SizedBox(height: 6),
//                 Row(
//                   children: [
//                     Icon(Icons.star, size: 14, color: Colors.amber),
//                     SizedBox(width: 4),
//                     Text(
//                       widget.item.rating.toString(),
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MenuItem {
//   final String name;
//   final String description;
//   final double rating;
//   final String image;

//   MenuItem({
//     required this.name,
//     required this.description,
//     required this.rating,
//     required this.image,
//   });
// }

// // Usage:
// void showSearchDetailPopup(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (_) => SearchDetailPopup(),
//   );
// }

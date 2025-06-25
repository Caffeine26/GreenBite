import 'package:flutter/material.dart';

class AddPhotoPage extends StatefulWidget {
  const AddPhotoPage({super.key});

  @override
  State<AddPhotoPage> createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  String? selectedImagePath;
  String? selectedCategory;

  // Predefined categories
  final List<String> categories = [
    'Meat',
    'Vegetarian',
    'Fast Food',
    'On Trend',
    'Uncategorized',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF18542A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: const Text(
          "Upload Recipe",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image upload box
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedImagePath = 'assets/images/akor.jpg';
                });
              },
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    selectedImagePath == null
                        ? const Center(child: Text("Tap to upload photo"))
                        : Image.asset(selectedImagePath!, fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 20),

            const Text("Recipe Title"),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: "Enter recipe title"),
            ),

            const SizedBox(height: 20),

            const Text("Description"),
            TextField(
              controller: _descController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Write a short description",
              ),
            ),

            const SizedBox(height: 20),

            const Text("Category"),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items:
                  categories
                      .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Select category",
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF18542A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (selectedImagePath != null &&
                      _titleController.text.isNotEmpty &&
                      _descController.text.isNotEmpty &&
                      selectedCategory != null) {
                    Navigator.pushReplacementNamed(
                      context,
                      '/upload-step2',
                      arguments: {
                        'image': selectedImagePath,
                        'title': _titleController.text,
                        'description': _descController.text,
                        'category': selectedCategory,
                        'rating': 5.0,
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please fill in all fields, including category',
                        ),
                      ),
                    );
                  }
                },
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

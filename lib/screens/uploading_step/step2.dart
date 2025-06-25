import 'package:flutter/material.dart';

class AddIngredientPage extends StatefulWidget {
  const AddIngredientPage({super.key});

  @override
  State<AddIngredientPage> createState() => _AddIngredientPageState();
}

class _AddIngredientPageState extends State<AddIngredientPage> {
  List<TextEditingController> ingredientControllers = [TextEditingController()];
  List<TextEditingController> methodControllers = [TextEditingController()];
  List<TextEditingController> materialControllers = [TextEditingController()];
  late Map<String, dynamic> uploadData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    uploadData =
        (ModalRoute.of(context)!.settings.arguments as Map)
            .cast<String, dynamic>();
  }

  void addControllerIfLastFilled(List<TextEditingController> controllers) {
    if (controllers.last.text.trim().isNotEmpty) {
      setState(() {
        controllers.add(TextEditingController());
      });
    }
  }

  Widget buildInputSection(
    String title,
    List<TextEditingController> controllers,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controllers.length,
          itemBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  key: UniqueKey(),
                  controller: controllers[index],
                  decoration: InputDecoration(
                    hintText: "$title ${index + 1}",
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (_) => addControllerIfLastFilled(controllers),
                ),
              ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void submitRecipe() {
    uploadData =
        (ModalRoute.of(context)!.settings.arguments as Map)
            .cast<String, dynamic>();
    uploadData['ingredients'] =
        ingredientControllers
            .map((e) => e.text.trim())
            .where((e) => e.isNotEmpty)
            .toList();
    uploadData['methods'] =
        methodControllers
            .map((e) => e.text.trim())
            .where((e) => e.isNotEmpty)
            .toList();
    uploadData['materials'] =
        materialControllers
            .map((e) => e.text.trim())
            .where((e) => e.isNotEmpty)
            .toList();
    Navigator.pushReplacementNamed(
      context,
      '/upload-progress',
      arguments: uploadData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Upload Recipe",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF18542A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildInputSection("Ingredient", ingredientControllers),
            buildInputSection("Method", methodControllers),
            buildInputSection("Material", materialControllers),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Back"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF18542A),
                  ),
                  onPressed: submitRecipe,
                  child: const Text(
                    "Post",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

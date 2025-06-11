import 'package:flutter/material.dart';
import 'package:instagram_clone/components/components.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageData = [
      'images/four.jpg',
      'images/five.jpg',
      'images/six.jpg',
      'images/seven.jpg',
      'images/eight.jpg',
      'images/nine.jpg',
      'images/ten.jpg',
      'images/eleven.jpg',
      'images/twelve.jpg',
      'images/thirteen.jpg',
      'images/fourteen.jpg',
      'images/fifteen.jpg',
      'images/sixteen.jpg',
      'images/seventeen.jpg',
      'images/eighteen.jpg',
      'images/nineteen.jpg',
      'images/twenty.jpg',
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 40,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/search_results');
            },
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search..',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: imageData.length,
        itemBuilder: (context, index) {
          return Image.asset(imageData[index], width: 10, height: 10);
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}

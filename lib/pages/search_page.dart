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
  void dispose() { // Fixed: Added void
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageData = [
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
      'images/twenty.jpg',
      'images/twenty.jpg',
      'images/twenty.jpg',
      'images/twenty.jpg',
      'images/twenty.jpg',
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
        // Add performance optimizations
        cacheExtent: 500,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Changed from 4 to 3 for better performance
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1.0, // Square images
        ),
        itemCount: imageData.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                imageData[index],
                // CRITICAL: Proper image optimization
                fit: BoxFit.cover,
                width: 120, // Set reasonable size
                height: 120,
                cacheWidth: 120, // Cache at smaller resolution
                cacheHeight: 120,
                // Add error handling
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
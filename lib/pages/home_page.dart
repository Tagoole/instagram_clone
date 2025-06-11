import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> profileData = [
      {'path': 'images/tagoole.jpg', 'name': 'Tagoole'},
      {'path': 'images/one.jpg', 'name': 'Mugwa'},
      {'path': 'images/two.jpg', 'name': 'David'},
      {'path': 'images/three.jpg', 'name': 'Trevor'},
      {'path': 'images/four.jpg', 'name': 'Patrick'},
      {'path': 'images/five.jpg', 'name': 'Wanume'},
      {'path': 'images/six.jpg', 'name': 'Charles'},
      {'path': 'images/seven.jpg', 'name': 'George'},
      {'path': 'images/eight.jpg', 'name': 'Fred'},
      {'path': 'images/nine.jpg', 'name': 'Trifler'},
      {'path': 'images/ten.jpg', 'name': 'Mukisa'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: GoogleFonts.chewy(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('Pressed the favourite button');
            },
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              print('Message icon tapped');
            },
            icon: Icon(Icons.bolt_rounded),
          ),
        ],
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: profileData.length + 1,
                    cacheExtent: 500, // 
                    addAutomaticKeepAlives: false, // 
                    addRepaintBoundaries: false, //
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: PersonalCircularProfile(),
                        );
                      } else {
                        final data = profileData[index - 1]; // Adjust index
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: OtherStories(
                            name: data['name']!,
                            path: data['path']!,
                            width1: 50,
                            height1: 50,
                            width2: 47,
                            height2: 47,
                            radius: 22,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: profileData.length,
                itemBuilder: (context, index) {
                  return PostBody(
                    name: profileData[index]['name']!, 
                    path: profileData[index]['path']!,
                    width1: 40,
                    height1: 40,
                    width2: 37,
                    height2: 37,
                    radius: 16,
                    );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0)
    );
  }
}

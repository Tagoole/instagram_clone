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
                    path: profileData[index]['path']!
                    );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // You can leave this empty for now if you don't need tab switching
        },
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            label: 'Home',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Add',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.video_call_rounded),
            label: 'Reels',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

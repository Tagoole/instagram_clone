import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
// import 'screens/search_screen.dart';
import 'screens/camera_screen.dart';
import 'screens/activity_screen.dart';
// import 'screens/reels_screen.dart';
import 'screens/profile_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:instagram_clone/pages/home_page.dart';
import 'package:instagram_clone/pages/login_page.dart';
import 'package:instagram_clone/pages/post_page.dart';
import 'package:instagram_clone/pages/profile_page.dart';
import 'package:instagram_clone/pages/reels_page.dart';
import 'package:instagram_clone/pages/search_page.dart';
import 'package:instagram_clone/pages/search_results.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),

      home: const MatrialScreen(),
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      routes: {
        '/login':(context) => LoginPage(),
        '/home':(context) => HomePage(),
        '/search':(context) => SearchPage(),
        '/post': (context) => PostPage(),
        '/reels': (context) => ReelsPage(),
        '/profile': (context) => ProfilePage(),
        '/search_results':(context) => SearchResults(),
      },
      );
  }
}

class MatrialScreen extends StatefulWidget {
  const MatrialScreen({Key? key}) : super(key: key);

  @override
  State<MatrialScreen> createState() => _MatrialScreenState();
}

class _MatrialScreenState extends State<MatrialScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
  const HomeScreen(),       // index 0
  SearchPage(),             // index 1 
  const CameraScreen(),     // index 2
  const ActivityScreen(),   // index 3
  const ProfileScreen(),    // index 4
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

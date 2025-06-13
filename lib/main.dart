import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:instagram_clone/pages/home_page.dart';
import 'package:instagram_clone/pages/login_page.dart';
import 'package:instagram_clone/pages/post_page.dart';
import 'package:instagram_clone/pages/profile_page.dart';
import 'package:instagram_clone/pages/reels_page.dart';
import 'package:instagram_clone/pages/search_page.dart';
import 'package:instagram_clone/pages/search_results.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(milliseconds: 50));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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


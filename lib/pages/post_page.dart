import 'package:flutter/material.dart';
import 'package:instagram_clone/components/components.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Post Page')),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 2),
      );
  }
}
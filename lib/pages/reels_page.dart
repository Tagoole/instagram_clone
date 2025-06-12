import 'package:flutter/material.dart';
import 'package:instagram_clone/components/components.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Reels', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print('Camera Button pressed');
            },
            icon: Icon(Icons.camera_alt_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(
            'images/a.jpg',
            height: 900,
            width: 400,
            cacheHeight: 900,
            cacheWidth: 400,
            )
          ),
          Positioned(
            right: 16,
            bottom: 10,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.white, size: 30),
                  onPressed: () {},
                ),
                Text('1.2K', style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),

                IconButton(
                  icon: Icon(Icons.chat_bubble_outline, color: Colors.white, size: 28),
                  onPressed: () {},
                ),
                Text('250', style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),

                Transform.rotate(angle: -0.5, child: IconButton(icon: Icon(Icons.send, color: Colors.white,), onPressed: () {},)),
                Text('Share',style: TextStyle(color: Colors.white),),

                IconButton(
                  icon: Icon(Icons.bookmark_border, color: Colors.white, size: 28),
                  onPressed: () {},
                ),
                Text('Save', style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),

                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.white, size: 26),
                  onPressed: () {},)
            ],
          ))
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 3),
    );
  }
}

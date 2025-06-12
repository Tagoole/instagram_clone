import 'package:flutter/material.dart';
import 'dart:math';

class PersonalCircularProfile extends StatelessWidget {
  const PersonalCircularProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Widget textArea = Text('Your Story');

    Widget profileBubble = Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('images/tagoole.jpg'),
          radius: 22,
        ),
        Icon(Icons.add_circle_rounded, color: Colors.lightBlueAccent, size: 16),
      ],
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [profileBubble, SizedBox(height: 2), textArea],
    );
  }
}

class PostBody extends StatefulWidget {
  final String path;
  final String name;
  final double width1;
  final double height1; // 50
  final double width2;
  final double height2; // 47
  final double radius;

  const PostBody({
    super.key,
    required this.name,
    required this.path,
    required this.height1,
    required this.width1,
    required this.height2,
    required this.width2,
    required this.radius,
  });

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  late final int likes; // Make it final and initialize once
  Color _likeIconColor = Colors.black;

  @override
  void initState() {
    super.initState();
    likes = Random().nextInt(1234455); // Generate once during initialization
  }

  void _changeIconColour() {
    _likeIconColor = (_likeIconColor == Colors.black)
        ? Colors.red
        : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              OtherStories(
                name: widget.name,
                path: widget.path,
                width1: widget.width1,
                height1: widget.height1,
                width2: widget.width2,
                height2: widget.height2,
                radius: widget.radius,
                nameBelow: false,
              ),
              SizedBox(width: 8),
              //Text(widget.name),
              SizedBox(width: 2),
              Spacer(),
              Icon(Icons.more_vert),
            ],
          ),
          Image.asset(
            widget.path,
            width: 350,
            height: 350,
            fit: BoxFit.cover,
            cacheHeight: 350,
            cacheWidth: 350,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 15),
              IconButton(
                onPressed: _changeIconColour,
                icon: Icon(
                  Icons.favorite,
                  color: _likeIconColor,
                ),
              ),
              Icon(Icons.add_comment_outlined),
              SizedBox(width: 10),
              Transform.rotate(angle: -0.5, child: Icon(Icons.send)),
              Spacer(),
              Icon(Icons.bookmark),
            ],
          ),
          Text('$likes', textAlign: TextAlign.left),
        ],
      ),
    );
  }
}

class OtherStories extends StatelessWidget {
  final String path;
  final String name;
  final double width1;
  final double height1; // 50
  final double width2;
  final double height2; // 47
  final double radius;
  final bool nameBelow;

  const OtherStories({
    super.key,
    required this.name,
    required this.path,
    required this.height1,
    required this.width1,
    required this.height2,
    required this.width2,
    required this.radius,
    this.nameBelow = true,
  });

  @override
  Widget build(BuildContext context) {
    String displayName = name.length > 6 ? '${name.substring(0, 6)}...' : name;

    Widget profilePicture = Stack(
      alignment: Alignment.center,
      children: [
        // outer container
        Container(
          height: height1,
          width: width1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.purpleAccent,
                Colors.redAccent,
                Colors.orangeAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        // second container
        Container(
          width: width2,
          height: height2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),

        // actual profile picture
        CircleAvatar(backgroundImage: AssetImage(path), radius: radius),
      ],
    );

    Widget textArea = Text(
      displayName,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
    return (nameBelow)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [profilePicture, SizedBox(height: 4), textArea],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [profilePicture, SizedBox(width: 4), textArea],
          );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (index) {
        // Navigate to different pages based on the tapped index
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/search');
            break;
          case 2:
            Navigator.pushNamed(context, '/post');
            break;
          case 3:
            Navigator.pushNamed(context, '/reels');
            break;
          case 4:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      items: const [
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
          icon: Icon(Icons.video_collection_rounded),
          label: 'Reels',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_3_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

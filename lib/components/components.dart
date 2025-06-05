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

class PostBody extends StatelessWidget {
  final String path;
  final String name;

  const PostBody({super.key, required this.name, required this.path});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    int likes = random.nextInt(1234455);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              OtherStories(name: name, path: path),
              SizedBox(width: 8),
              Text(name),
              SizedBox(width: 2),
              Spacer(),
              Icon(Icons.more_vert),
            ],
          ),
          Image.asset(path),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 15),
              Icon(Icons.favorite_rounded),
              SizedBox(width: 10),
              Icon(Icons.add_comment_outlined),
              SizedBox(width: 10),
              Transform.rotate(angle: -0.5, child: Icon(Icons.send)),
              Spacer(),
              Icon(Icons.bookmark),
            ],
          ),
          Text(
            '${likes}',
            textAlign: TextAlign.left,
            ),
        ],
      ),
    );
  }
}

class OtherStories extends StatelessWidget {
  final String path;
  final String name;

  const OtherStories({super.key, required this.name, required this.path});

  @override
  Widget build(BuildContext context) {
    String displayName = name.length > 6 ? '${name.substring(0, 6)}...' : name;

    Widget profilePicture = Stack(
      alignment: Alignment.center,
      children: [
        // outer container
        Container(
          height: 50,
          width: 50,
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
          width: 47,
          height: 47,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),

        // actual profile picture
        CircleAvatar(backgroundImage: AssetImage(path), radius: 22),
      ],
    );

    Widget textArea = Text(
      displayName,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [profilePicture, SizedBox(height: 4), textArea],
    );
  }
}

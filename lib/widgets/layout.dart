import 'dart:ffi';

import 'package:flutter/material.dart';

import 'profile_cover.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int tap_index = 0;
  List<String> tapsText = ["Bio", "Friends", "Posts"];

  void setTapIndex(int value) {
    setState(() {
      tap_index = value;
    });
  }

  Widget getBody() {
    if (tap_index == 0) {
      return BioCotent();
    } else if (tap_index == 1) {
      return FriendsContent();
    } else {
      return PostsContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          ProfileCover(),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < tapsText.length; i++)
                  Taps(
                    text: tapsText[i],
                    onClick: setTapIndex,
                    isActive: i == tap_index ? true : false,
                    index: i,
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: getBody(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Taps extends StatelessWidget {
  final String text;
  final Function onClick;
  final bool isActive;
  final int index;
  const Taps(
      {Key? key,
      required this.text,
      required this.onClick,
      required this.isActive,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(index),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                    width: 2,
                    color: isActive ? Color(0xFFDD08FA) : Color(0xFF7E7D7D)),
              )),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF326084),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostsContent extends StatelessWidget {
  const PostsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "This is my post 1.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "1.4 k (views)",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("This is my post 1."),
              Text("1.4 k (views)"),
            ],
          )
        ],
      ),
    );
  }
}

class FriendsContent extends StatelessWidget {
  const FriendsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.group,
            color: Color(0xFF7E7D7D),
            size: 100,
          ),
          Text(
            "2,103 Friends",
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}

class BioCotent extends StatelessWidget {
  const BioCotent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.speaker_notes,
            color: Color(0xFF7E7D7D),
            size: 100,
          ),
          Text(
            "I like travelling.",
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}

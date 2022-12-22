import 'package:flutter/material.dart';

class ProfileCover extends StatelessWidget {
  const ProfileCover({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xff326084),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("images/img_profile.jpg"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Sok Nimol",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

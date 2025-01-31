import 'package:flutter/material.dart';

class Titlewithdesc extends StatelessWidget {
  const Titlewithdesc({super.key, required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Text(
            desc,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}

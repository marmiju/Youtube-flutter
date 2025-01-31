import 'package:flutter/material.dart';

class Titlewithdesc extends StatelessWidget {
  const Titlewithdesc(
      {super.key,
      required this.title,
      required this.desc,
      required this.titlesize,
      required this.descsize});

  final String title;
  final String desc;
  final double titlesize;
  final double descsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: titlesize, fontWeight: FontWeight.bold),
        ),
        Text(
          desc,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: descsize, color: Colors.blueGrey),
        ),
      ],
    );
  }
}

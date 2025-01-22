import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:you_tube/View/Screen/Profile.dart';

final List<Widget> Pages = [
  Center(
      child: Column(
    children: [
      Container(
        height: 300,
        width: 400,
        color: const Color.fromARGB(255, 255, 31, 1),
        child: Text(dotenv.get('APP_NAME')),
      ),
      Container(
        height: 300,
        width: 400,
        color: const Color.fromARGB(255, 255, 230, 1),
        child: Text("hello"),
      ),
      Container(
        height: 300,
        width: 400,
        color: const Color.fromARGB(255, 59, 255, 10),
        child: Text("hello"),
      ),
    ],
  )),
  Center(
    child: Text('Shorts'),
  ),
  Center(
    child: Text('Upload'),
  ),
  Center(
    child: Text('Subscription'),
  ),
  Center(
    child: Profile(),
  ),
];

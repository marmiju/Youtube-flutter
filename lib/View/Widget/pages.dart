import 'package:flutter/material.dart';
import 'package:you_tube/View/Screen/Profile.dart';
import 'package:you_tube/View/Screen/VideoScreen/VIdeoScreen.dart';

final List<Widget> Pages = [
  Center(child: Videoscreen()),
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

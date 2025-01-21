import 'package:flutter/material.dart';
import 'package:you_tube/View/Screen/Profile.dart';

final List<Widget> Pages = [
  Center(
      child: Text(
    'Home',
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

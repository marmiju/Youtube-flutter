import 'package:flutter/material.dart';
import 'package:you_tube/View/Screen/Profile.dart';
import 'package:you_tube/View/Widget/BottomNavbar.dart';
import 'package:you_tube/View/Widget/pages.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/youtube.png',
            width: 60,
            height: 80,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.filter_list),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.notifications),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: SingleChildScrollView(
              child: Pages.elementAt(_selectedIndex),
            ),
          ),
        ),
        bottomNavigationBar: Bottomnavigation(
          navpress: (index) {
            _selectedIndex = index;
            setState(() {});
          },
        ));
  }
}

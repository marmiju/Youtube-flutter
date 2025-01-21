import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Provider/CurrentUserProvider.dart';

class Bottomnavigation extends ConsumerStatefulWidget {
  const Bottomnavigation({super.key, required this.navpress});

  final void Function(int index) navpress;

  @override
  ConsumerState<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends ConsumerState<Bottomnavigation> {
  int index = 0; // Initialize the index to 0

  @override
  Widget build(BuildContext context) {
    final _currentUser = ref.watch(currentUserDataProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            border: Border(top: BorderSide(color: Colors.blueGrey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  index = 0;
                });
                widget.navpress(index);
              },
              icon: Icon(
                index == 0 ? Icons.home : Icons.home_outlined,
                size: 35,
                color: Colors.black,
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Container();
                }));
              },
              child: Image.asset(
                'assets/images/shorts.png',
                height: 27,
              ),
            ),

            // Add Button
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Container();
                }));
              },
              icon: Icon(
                Icons.add,
                size: 30,
                color: index == 2 ? Colors.red : Colors.black, // Change color
                shadows: [
                  Shadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 10,
                  )
                ],
              ),
            ),

            // Home (Alternate) Button

            InkWell(
              onTap: () {
                setState(() {
                  index = 3;
                });
                widget.navpress(index);
              },
              child: Image.asset(
                index == 3
                    ? 'assets/images/subscription2.png'
                    : 'assets/images/subscription.png',
                height: 27,
              ),
            ),

            // Profile Picture Button
            InkWell(
              onTap: () {
                setState(() {
                  index = 4;
                });
                widget.navpress(index);
              },
              child: Container(
                padding: index == 4 ? EdgeInsets.all(3) : EdgeInsets.all(0),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    border: Border.all(width: index == 4 ? 2 : 0),
                    borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  clipBehavior: Clip.hardEdge,
                  child: _currentUser.when(
                    data: (data) => Center(
                      child: Image.network(data!.profilePic),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Icon(Icons.person),
                    ),
                    loading: () => Center(
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Provider/CurrentUserProvider.dart';
import 'package:you_tube/View/Widget/Button/TextButton.dart'; // Your custom TextButton widget
import 'package:you_tube/View/Widget/Button/LogoButton.dart';
import 'package:you_tube/View/Widget/textfield/Textfield.dart';
import 'package:you_tube/View/Widget/userCard/UserCard.dart';

class Uploadingdemo extends ConsumerStatefulWidget {
  const Uploadingdemo({super.key, required this.video, required this.fileName});

  final File video;
  final String fileName;

  @override
  ConsumerState<Uploadingdemo> createState() => _UploadingdemoState();
}

class _UploadingdemoState extends ConsumerState<Uploadingdemo> {
  bool isPublic = true;

  @override
  Widget build(BuildContext context) {
    final userdata = ref.watch(currentUserDataProvider);
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/images/you_tube.png',
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      userdata.when(
                        data: (data) => Usercard(user: data!),
                        error: (err, s) => Text(err.toString()),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textfield(
                              controller: titleController,
                              hintText:
                                  "Enter Your Video title e.x @${userdata.value!.username}",
                              hight: 75,
                              title: 'Video title:',
                            ),
                            const SizedBox(height: 20),
                            Textfield(
                              controller: descriptionController,
                              hintText:
                                  "Enter Your Video Description e.x @${userdata.value!.username}",
                              hight: 120,
                              title: 'Video Description:',
                            ),
                            const SizedBox(height: 20),
                            LogoButton(
                              img: 'assets/images/google.png',
                              title: isPublic ? 'public' : 'private',
                              btnclick: () {
                                setState(() {
                                  isPublic = !isPublic;
                                });
                              },
                              horizentalalign: MainAxisAlignment.start,
                              textcolor: Colors.black87,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                                'Privacy could be changed after clicking'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white, // Background color for the footer
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child:
                    textButton(text: 'Next'), // Your custom TextButton widget
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Listener/upLoad_litsener.dart';
import 'package:you_tube/Controller/Provider/Users/CurrentUserProvider.dart';
import 'package:you_tube/Controller/Provider/Videos/UploadStatus.dart';
import 'package:you_tube/View/Screen/Profile.dart';
import 'package:you_tube/View/Widget/Button/TextButton.dart'; // Custom TextButton widget
import 'package:you_tube/View/Widget/Button/LogoButton.dart';
import 'package:you_tube/View/Widget/textfield/Textfield.dart';
import 'package:you_tube/View/Widget/userCard/UserCard.dart';

class Uploadingdemo extends ConsumerStatefulWidget {
  Uploadingdemo({super.key, this.video, this.fileName});

  File? video;
  String? fileName;

  @override
  ConsumerState<Uploadingdemo> createState() => _UploadingdemoState();
}

class _UploadingdemoState extends ConsumerState<Uploadingdemo> {
  bool isPublic = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userdata = ref.watch(currentUserDataProvider);
    final uploadStatus = ref.watch(uploadStatusProvider); // Listen to status
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
                      // Show status based on uploadStatus
                      if (uploadStatus == 'uploading') ...[
                        const CircularProgressIndicator(),
                        const SizedBox(height: 10),
                        const Text('Uploading video, please wait...'),
                      ] else if (uploadStatus == 'success') ...[
                        const Icon(Icons.check_circle, color: Colors.green),
                        const Text('Video uploaded successfully!'),
                      ] else if (uploadStatus == 'error') ...[
                        const Icon(Icons.error, color: Colors.red),
                        const Text('An error occurred during upload.'),
                      ],
                      const SizedBox(height: 20),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textfield(
                              controller: titleController,
                              hintText: "Enter Your Video title ",
                              hight: 75,
                              title: 'Video title:',
                            ),
                            const SizedBox(height: 20),
                            Textfield(
                              controller: descriptionController,
                              hintText: "Enter Your Video Description ",
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
                child: uploadStatus == 'uploading'
                    ? LinearProgressIndicator()
                    : textButton(
                        text: 'Upload',
                        ontap: () {
                          uploadLitsener(
                            titleController.text,
                            descriptionController.text,
                            isPublic,
                            'assets/images/you_tube.png',
                            widget.video,
                            widget.fileName,
                            context,
                            ref,
                          );
                        },
                      ), // Custom TextButton widget
              ),
            ),
          ],
        ),
      ),
    );
  }
}

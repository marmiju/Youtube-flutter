import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Provider/CurrentUserProvider.dart';
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
  @override
  Widget build(BuildContext context) {
    final userdata = ref.watch(currentUserDataProvider);
    TextEditingController _titlecontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/you_tube.png',
                  height: 150,
                  fit: BoxFit.cover,
                ),
                userdata.when(
                    data: (data) => Usercard(user: data!),
                    error: (err, s) {
                      return Text(err.toString());
                    },
                    loading: () => Center(
                          child: CircularProgressIndicator(),
                        )),
                SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                  children: [
                    Textfield(
                      controller: _titlecontroller,
                      hintText:
                          "Enter Your Video title e.x @${userdata.value!.username} ",
                      hight: 75,
                      title: 'Video title :',
                    ),
                    SizedBox(height: 20),
                    Textfield(
                      controller: _titlecontroller,
                      hintText:
                          "Enter Your Video Description e.x @${userdata.value!.username} ",
                      hight: 100,
                      title: 'Video Description :',
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

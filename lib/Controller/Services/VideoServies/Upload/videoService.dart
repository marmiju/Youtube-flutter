import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Model/VideoModel.dart';
import 'package:you_tube/View/Screen/HomePage.dart';

class Videoservice {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future setVideo(title, description, isPublic, thumbnail, url, WidgetRef ref,
      context) async {
    final video = Videomodel(
        title: title,
        description: description,
        isPublic: isPublic,
        thumbnail: thumbnail,
        author: auth.currentUser!.uid,
        url: url,
        username: auth.currentUser!.displayName!,
        views: 0);

    try {
      await firestore
          .collection('videos')
          .doc(Timestamp.now().toString())
          .set(video.tomap());
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Uploaded video'),
              content: Text('your video uploaded succesfully!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    child: Text('Ok!'))
              ],
            );
          });
    } catch (e) {
      throw Expando('error $e');
    }
  }
}

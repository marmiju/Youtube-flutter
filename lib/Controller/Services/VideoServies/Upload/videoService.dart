import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:you_tube/Controller/Provider/Videos/UploadStatus.dart';
import 'package:you_tube/Model/VideoModel.dart';
import 'package:you_tube/View/Screen/HomePage.dart';

class Videoservice {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future setVideo(
      title, description, isPublic, thumbnail, url, ref, context) async {
    final uploadStatusNotifier = ref.read(uploadStatusProvider.notifier);

    final video = Videomodel(
        title: title,
        description: description,
        isPublic: isPublic,
        thumbnail: thumbnail,
        author: auth.currentUser!.uid,
        url: url,
        username: auth.currentUser!.displayName!,
        views: 0,
        publishDate: Timestamp.now(),
        profilepic: auth.currentUser!.photoURL);

    try {
      await firestore
          .collection('videos')
          .doc(Timestamp.now().toString())
          .set(video.tomap());

      uploadStatusNotifier.setStatus('success');

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Uploaded video✅'),
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

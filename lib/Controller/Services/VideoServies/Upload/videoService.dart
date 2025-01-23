import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:you_tube/Controller/Provider/Videos/UploadStatus.dart';
import 'package:you_tube/Model/VideoModel.dart';

class Videoservice {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future setVideo(title, description, isPublic, thumbnail, url) async {
    final video = Videomodel(
      title: title,
      description: description,
      isPublic: isPublic,
      thumbnail: thumbnail,
      author: auth.currentUser!.uid,
      url: url,
      username: auth.currentUser!.displayName!,
    );

    await firestore
        .collection('videos')
        .doc(auth.currentUser!.uid)
        .set(video.tomap());
    isUploaded().uploadstatus(true);
  }
}

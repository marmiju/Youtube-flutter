import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_tube/Model/VideoModel.dart';

class Videos {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Videomodel>> fetchVideos() {
    try {
      print('Fetching videos...');
      return db.collection('videos').snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return Videomodel.fromJson(doc.data());
        }).toList();
      });
    } catch (e) {
      throw Exception('Error fetching videos: ${e.toString()}');
    }
  }
}

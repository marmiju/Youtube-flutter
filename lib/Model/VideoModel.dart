import 'package:cloud_firestore/cloud_firestore.dart';

class Videomodel {
  final String title;
  final String description;
  final bool isPublic;
  final url;
  final thumbnail;
  final String username;
  final int views;
  final String author;
  final Timestamp publishDate;
  final profilepic;

  Videomodel(
      {required this.title,
      required this.description,
      required this.isPublic,
      required this.thumbnail,
      required this.author,
      required this.url,
      required this.username,
      required this.views,
      required this.publishDate,
      required this.profilepic});

  Map<String, dynamic> tomap() {
    return {
      'title': title,
      'description': description,
      'isPublic': isPublic,
      'thumbnail': thumbnail,
      'author': author,
      'url': url,
      'username': username,
      'views': views,
      'publishDate': publishDate,
      'profilepic': profilepic
    };
  }

  factory Videomodel.fromJson(Map<String, dynamic> json) {
    return Videomodel(
        title: json['title'] as String,
        description: json['description'] as String,
        isPublic: json['isPublic'] as bool,
        thumbnail: json['thumbnail'],
        author: json['author'],
        url: json['url'],
        username: json['username'],
        views: json['views'],
        publishDate: json['publishDate'],
        profilepic: json['profilepic']);
  }
}

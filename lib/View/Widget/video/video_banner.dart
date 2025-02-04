import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:you_tube/Model/VideoModel.dart';
import 'package:you_tube/View/Widget/userCard/titlewithDesc.dart';

class VideoBanner extends StatelessWidget {
  const VideoBanner({super.key, required this.video});

  final Videomodel video;

  String timeAgo(Timestamp timestamp) {
    final DateTime now = DateTime.now();
    final DateTime dateTime = timestamp.toDate();
    final Duration difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} seconds ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else if (difference.inDays < 30) {
      return "${difference.inDays} days ago";
    } else if (difference.inDays < 365) {
      return "${difference.inDays ~/ 30} months ago";
    } else {
      return "${difference.inDays ~/ 365} years ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.network(
                  video.thumbnail,
                  width: double.infinity,
                  height: 180, // Set a fixed height to avoid overflow
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.broken_image,
                          size: 50, color: Colors.red)),
                ),
                Positioned(
                  bottom: 0, // Align at the bottom
                  left: 0, // Align to the left
                  right: 0, // Stretch to full width
                  child: LinearProgressIndicator(
                    color: Colors.red,
                    value: 0.6, // Should be dynamic based on progress
                    minHeight: 5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage:
                    video.profilepic != null && video.profilepic!.isNotEmpty
                        ? NetworkImage(video.profilepic!)
                        : const AssetImage('assets/images/google.png')
                            as ImageProvider,
              ),
              const SizedBox(width: 10), // Spacing between avatar and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Titlewithdesc(
                      title: video.title,
                      desc: video.description,
                      titlesize: 18,
                      descsize: 14,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${video.username} • ${video.views >= 1000 ? '${(video.views / 1000).toStringAsFixed(1)}K' : video.views} Views • ${timeAgo(video.publishDate)}',
                      style: TextStyle(color: Colors.grey[700], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

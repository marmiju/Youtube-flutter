import 'package:supabase_flutter/supabase_flutter.dart';

uploadVideo(video, fileName) async {
  final SupabaseClient supabase = Supabase.instance.client;

  try {
    // Read the video file as bytes
    final fileBytes = await video.readAsBytes();

    final response = await supabase.storage.from('videos').uploadBinary(
          fileName,
          fileBytes,
          fileOptions: const FileOptions(
            cacheControl: '3600',
            upsert: false,
          ),
        );

    if (response.isNotEmpty) {
      //download file url
      final publicUrl = supabase.storage.from('videos').getPublicUrl(fileName);
      print("Download URL: $publicUrl");
    } else {
      print("Error uploading video: ");
    }
  } catch (e) {
    print("Error: $e");
  }
}

uploadShorts(video, fileName) async {
  final SupabaseClient supabase = Supabase.instance.client;

  try {
    // Read the video file as bytes
    final fileBytes = await video.readAsBytes();

    final response = await supabase.storage.from('Shorts').uploadBinary(
          fileName,
          fileBytes,
          fileOptions: const FileOptions(
            cacheControl: '3600',
            upsert: false,
          ),
        );

    if (response.isNotEmpty) {
      //download file url
      final publicUrl = supabase.storage.from('videos').getPublicUrl(fileName);
      print("Download URL: $publicUrl");
    } else {
      print("Error uploading video: ");
    }
  } catch (e) {
    print("Error: $e");
  }
}

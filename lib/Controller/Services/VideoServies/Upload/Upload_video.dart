import 'package:supabase_flutter/supabase_flutter.dart';

uploadVideo(video, fileName, context) async {
  final SupabaseClient supabase = Supabase.instance.client;

  try {
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
      return publicUrl;
    } else {}
  } catch (e) {
    throw Exception("err message : $e");
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
      final publicUrl = supabase.storage.from('videos').getPublicUrl(fileName);
      print("Download URL: $publicUrl");
    }
  } catch (e) {
    print("Error: $e");
  }
}

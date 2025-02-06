import 'dart:io';
import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

Future<String?> uploadImage(File? thumbnail) async {
  final SupabaseClient supabase = Supabase.instance.client;

  try {
    if (thumbnail == null) {
      return 'https://i.ibb.co.com/qYTSWN61/thumbnail.png';
    }
    final String fileName = '${const Uuid().v4()}.jpg';

    Uint8List fileBytes = await thumbnail.readAsBytes();

    await supabase.storage.from('images').uploadBinary(
          fileName,
          fileBytes,
          fileOptions: const FileOptions(contentType: 'image/jpeg'),
        );

    final publicUrl = supabase.storage.from('images').getPublicUrl(fileName);

    return publicUrl;
  } catch (e) {
    throw Exception("Error uploading image: $e");
  }
}

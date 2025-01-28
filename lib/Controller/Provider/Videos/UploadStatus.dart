import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadStatusProvider =
    StateNotifierProvider<UploadStatusNotifier, String>(
  (ref) => UploadStatusNotifier(),
);

class UploadStatusNotifier extends StateNotifier<String> {
  UploadStatusNotifier() : super('idle'); // Initial state is idle

  void setStatus(String status) {
    state = status;
  }
}

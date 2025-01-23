import 'package:flutter_riverpod/flutter_riverpod.dart';

class isUploaded extends StateNotifier<bool> {
  isUploaded() : super(false);

  uploadstatus(bool isTrue) {
    state = isTrue;
  }
}

final uploadStatusProvider =
    StateNotifierProvider<isUploaded, bool>((ref) => isUploaded());

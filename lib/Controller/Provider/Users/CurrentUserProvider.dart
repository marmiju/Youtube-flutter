import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Services/User/getCurrentUser.dart';
import 'package:you_tube/Model/UserModel.dart';

// Define a provider for the GetCurrentUser class
final getCurrentUserProvider = Provider((ref) => GetCurrentUser());

// Define a FutureProvider to fetch the current user data
final currentUserDataProvider = StreamProvider<Usermodel?>((ref) {
  final getCurrentUser = ref.watch(getCurrentUserProvider);
  return getCurrentUser.getCurrentUserData();
});

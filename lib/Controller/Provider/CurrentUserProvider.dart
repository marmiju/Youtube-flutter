import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Services/getCurrentUser.dart';
import 'package:you_tube/Model/UserModel.dart';

// Define a provider for the GetCurrentUser class
final getCurrentUserProvider = Provider((ref) => GetCurrentUser());

// Define a FutureProvider to fetch the current user data
final currentUserDataProvider = FutureProvider<Usermodel?>((ref) async {
  final getCurrentUser = ref.watch(getCurrentUserProvider);
  return await getCurrentUser.getCurrentUserData();
});

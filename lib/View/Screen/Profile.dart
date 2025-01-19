import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Provider/CurrentUserProvider.dart';
import 'package:you_tube/View/Widget/userCard/UserCard.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserDataProvider);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            user.when(
                data: (data) => Usercard(user: data!),
                error: (err, s) => Text("Opps! something else"),
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    ))
          ],
        ),
      ),
    );
  }
}

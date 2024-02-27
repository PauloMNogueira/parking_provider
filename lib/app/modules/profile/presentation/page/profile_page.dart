import 'package:flutter/material.dart';
import 'package:parking_provider/app/modules/profile/presentation/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Consumer<ProfileProvider>(
          builder: (context, provider, _) {
            final userProfile = provider.userProfile;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${userProfile.name}'),
                Text('Email: ${userProfile.email}'),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<ProfileProvider>(context, listen: false)
                .updateProfile();
          },
          child: const Icon(Icons.swap_horiz_sharp)),
    );
  }
}

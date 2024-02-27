import 'package:flutter/material.dart';
import 'package:parking_provider/app/modules/profile/presentation/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class DetailsProfilePage extends StatelessWidget {
  const DetailsProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ProfileProvider>(context).profileColor,
        title: const Text('Minha Página'),
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
    );
  }
}

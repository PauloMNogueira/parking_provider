import 'package:flutter/material.dart';

// TODO Create AppPage Mixin
class SplashPage extends StatelessWidget {
  //with AppPage

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SPLASH'),
      ),
    );
  }
}

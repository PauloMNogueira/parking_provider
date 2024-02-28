import 'package:flutter/material.dart';

class MovieListWidget extends StatelessWidget {
  final String imageUrl;

  const MovieListWidget({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(
        imageUrl,
        height: 250,
        width: 250,
        // fit: BoxFit.cover,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:parking_provider/app/modules/movie/presentation/page/widgets/movie_list_widget.dart';
import 'package:parking_provider/app/modules/movie/presentation/provider/discovery_provider.dart';
import 'package:parking_provider/app/modules/profile/presentation/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class MovieDiscoveryPage extends StatelessWidget {
  const MovieDiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Consumer<DiscoveryProvider>(
          builder: (context, provider, _) {
            final moviesWidgets = provider.movies.map((e) {
              return MovieListWidget(
                  imageUrl: 'https://image.tmdb.org/t/p/w500/${e.poster}');
            });
            return provider.movies.isNotEmpty
                ? SizedBox(
                    width: 500,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [...moviesWidgets],
                    ),
                  )
                : const Text(
                    'Erro',
                    style: TextStyle(color: Colors.white),
                  );
          },
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:parking_provider/app/modules/movie/domain/movie_entity.dart';
import 'package:parking_provider/app/modules/movie/domain/movie_repository.dart';
import 'package:super_module/services/http.service.dart';

class MovieRepositoryImpl implements MovieRepository {
  final HttpService httpService;

  MovieRepositoryImpl({required this.httpService});
  @override
  Future<List<Movie>> discovery() async {
    final newHttp =
        httpService.copyWith(baseUrl: 'https://api.themoviedb.org/3', headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZDNmOGEwMjk0ZGYzOWI2NDFiOWMyMDcyMzY2NTVhNyIsInN1YiI6IjY1ZGU0ODJmYWVkZTU5MDE4Nzk4ZjI3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rZVGfMHfqvR_ti6cXpzGHk3nksLO7KnZnpQQaFzEvvM',
    });
    final response = await newHttp.get(
        '/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');

    if (response.statusCode == 200) {
      List<Movie> movies = [];
      List<dynamic> jsonData = response.data?['data']['results'];
      for (var item in jsonData) {
        Movie movie = Movie(
            id: item['id'],
            originalLanguage: item['original_language'],
            originalTitle: item['original_title'],
            overview: item['overview'],
            popularity: item['popularity'],
            poster: item['poster_path'],
            title: item['title']);
        movies.add(movie);
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

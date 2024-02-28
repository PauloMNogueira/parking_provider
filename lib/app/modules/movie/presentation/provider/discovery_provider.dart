import 'package:flutter/material.dart';
import 'package:parking_provider/app/modules/movie/domain/movie_entity.dart';
import 'package:parking_provider/app/modules/movie/domain/movie_repository.dart';

class DiscoveryProvider extends ChangeNotifier {
  final MovieRepository _repository;
  List<Movie> _movies = [];

  DiscoveryProvider(this._repository) {
    _loadMovies();
  }

  List<Movie> get movies => _movies;

  Future<void> _loadMovies() async {
    _movies = await _repository.discovery();
    notifyListeners();
  }
}

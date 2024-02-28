import 'package:parking_provider/app/modules/movie/domain/movie_entity.dart';

abstract class MovieRepository {
  Future<List<Movie>> discovery();
}

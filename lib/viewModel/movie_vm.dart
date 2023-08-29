

import 'package:movie/model/movieResponse.dart';

class MovieViewModel {

  final MovieResponse movie;

  MovieViewModel({required this.movie});

  String get title {
    return this.movie.title;
  }

  String get poster {
    return this.movie.posterPath;
  }

}
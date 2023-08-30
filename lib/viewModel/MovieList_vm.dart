import 'package:flutter/material.dart';
import '../model/MoviesResponse.dart';
import '../web_services/webService.dart';

class MovieListViewModel extends ChangeNotifier {
  List<Movie> popularMovies=[] ;
  List<Movie> topRatedMovies=[] ;
  List<Movie> searchedMovies=[] ;

  fetchMovies(String keyword) async {
    final results =  await Webservice().fetchPopularMovies(keyword);
    popularMovies = results.map((item) => item).toList();
    notifyListeners();
  }

  fetchTopRatedMovies(String keyword) async {
    final results =  await Webservice().fetchTopRatedMovies(keyword);
    topRatedMovies = results.map((item) => item).toList();
    notifyListeners();
  }
  fetchSearchedMovies(String keyword) async {
    final results =  await Webservice().fetchSearchedMovies(keyword);
    searchedMovies = results.map((item) => item).toList();
    notifyListeners();
  }

}
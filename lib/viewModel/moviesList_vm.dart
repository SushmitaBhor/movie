// import 'package:flutter/material.dart';
//
// import '../web_services/webService.dart';
// import 'movie_vm.dart';
//
//
// class MovieListViewModel extends ChangeNotifier {
//
//   List<MovieViewModel>? movies ;
//
//   Future<void> fetchMovies(String keyword) async {
//     final results =  await Webservice().fetchMovies(keyword);
//     this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
//     notifyListeners();
//   }
//
// }
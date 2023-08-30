import 'package:flutter/material.dart';
import '../model/popularMovies.dart';
import '../web_services/webService.dart';

class PopularMovieListViewModel extends ChangeNotifier {
  List<Result> popularMovies=[] ;
  List<Result> topRatedMovies=[] ;

  fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);
    popularMovies = results.map((item) => item).toList();
    notifyListeners();
  }

  fetchTopRatedMovies(String keyword) async {
    final results =  await Webservice().fetchTopRatedMovies(keyword);
    topRatedMovies = results.map((item) => item).toList();
    notifyListeners();
  }

}
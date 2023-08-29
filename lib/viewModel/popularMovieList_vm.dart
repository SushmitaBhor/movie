import 'package:flutter/material.dart';
import 'package:movie/viewModel/popular_movie_vm.dart';
import '../model/popularMovies.dart';
import '../web_services/webService.dart';



class PopularMovieListViewModel extends ChangeNotifier {

   List<Result> popularMovies=[] ;


  fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);
    popularMovies = results.map((item) => item).toList();
    notifyListeners();

  }

}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/MoviesResponse.dart';

class Webservice {
  Future<List<Movie>> fetchPopularMovies(String keyword) async {
    const String url =
        "https://api.themoviedb.org/3/movie/popular?api_key=91d7d40ef6cd4a35e4b291baa77dd09a&";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final List<dynamic> json = body['results'];
      final List<Movie> movie = json.map((e) => Movie.fromJson(e)).toList();
      print("popular movies ${json.map((e) => Movie.fromJson(e)).first.title}");
      return movie;
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<Movie>> fetchTopRatedMovies(String keyword) async {
    const String url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=91d7d40ef6cd4a35e4b291baa77dd09a";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final List<dynamic> json = body['results'];
      final List<Movie> movie = json.map((e) => Movie.fromJson(e)).toList();
      print("top rated ${json.map((e) => Movie.fromJson(e)).first.title}");
      return movie;
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<Movie>> fetchSearchedMovies(String keyword) async {
    final String url =
        "https://api.themoviedb.org/3/search/movie?api_key=91d7d40ef6cd4a35e4b291baa77dd09a&query=$keyword";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final List<dynamic> json = body['results'];
      final List<Movie> movie = json.map((e) => Movie.fromJson(e)).toList();
      print("searched movie ${response.body}");
      return movie;
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}

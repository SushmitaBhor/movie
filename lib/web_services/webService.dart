import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/popularMovies.dart';


class Webservice {

  Future<List<Result>> fetchMovies(String keyword) async {

    final String url = "https://api.themoviedb.org/3/movie/popular?api_key=91d7d40ef6cd4a35e4b291baa77dd09a&";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {

      final body = jsonDecode(response.body);

      final List<dynamic>  json = body['results'];
      final List<Result> movie=json.map((e) => Result.fromJson(e)).toList();
      print("ede ${json.map((e) => Result.fromJson(e)).first.title}");
return movie;


    } else {
      throw Exception("Unable to perform request!");
    }
  }
  Future<List<Result>> fetchTopRatedMovies(String keyword) async {

    final String url = "https://api.themoviedb.org/3/movie/top_rated?api_key=91d7d40ef6cd4a35e4b291baa77dd09a";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {

      final body = jsonDecode(response.body);

      final List<dynamic>  json = body['results'];
      final List<Result> movie=json.map((e) => Result.fromJson(e)).toList();
      print("top rated ${json.map((e) => Result.fromJson(e)).first.title}");
return movie;


    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  List trendingmovies = [];

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, apiReadAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    setState(() {
      trendingmovies = trendingResult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Movie App'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:movie/utils/text.dart';
import 'package:movie/widgets/searchBar.dart';
import 'package:movie/widgets/toprated.dart';
import 'package:movie/widgets/trending.dart';
import 'package:movie/widgets/tv.dart';
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
  late TMDB tmdbWithCustomLogs;

  List trendingmovies = [];
  List topratedmovies=[];
  List tv = [];


  loadMovies() async {
     tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, apiReadAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingResult['results'];
      topratedmovies = topratedResult['results'];
      tv = tvResult['results'];
    });
    print(trendingmovies);
  }
onItemChanged(v)async{
  Map search=await tmdbWithCustomLogs.v3.search.queryMovies(v.toString().toLowerCase());
  setState(() {
    newList=search['results'];
  });
  print("_____________________________________${newList}");
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(    backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        title: modified_text(text: 'Flutter Movie App❤️',),

      ),
      body: ListView(
      children: [
        SearchMovies(onItemChanged:onItemChanged),
        TrendingMovies(trending:  newList.isEmpty? trendingmovies:newList,),
        TV(tv:newList.isEmpty?  tv:newList,),
        TopRated(toprated: newList.isEmpty? topratedmovies:newList,),

      ],
      ),
    );
  }
}

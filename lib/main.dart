import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:movie/utils/text.dart';
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
  List newList=[];

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(    backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        title: modified_text(text: 'Flutter Movie App❤️',),

      ),
      body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: textController,
            style:TextStyle(
                color: const Color(0xff666666),
                fontWeight: FontWeight.w300,
                fontSize: 16.0),
            decoration: InputDecoration(isDense: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                contentPadding: EdgeInsets.only(left: 20),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 1,
                      height: 30,
                      color: const Color(0xffC5C5C5),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 17.0),
                      child: Icon(Icons.search,color: kbackgroundColor,)
                    )
                  ],
                ),
                hintText: 'Search',hintStyle: TextStyle(
                    color: const Color(0xff666666),
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0),
                filled: true,
                fillColor: const Color(0xffFBEEFE)),
            onChanged:(v) async{
          Map search=await tmdbWithCustomLogs.v3.search.queryMovies(v.toString().toLowerCase());
          setState(() {
          newList=search['results'];
          });
          print("_____________________________________${newList}");
          }
          ),
        ),
        TrendingMovies(trending:  newList.isEmpty? trendingmovies:newList,),
        TV(tv:newList.isEmpty?  tv:newList,),
        TopRated(toprated: newList.isEmpty? topratedmovies:newList,),

      ],
      ),
    );
  }
}

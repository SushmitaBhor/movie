import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:movie/utils/text.dart';
import 'package:movie/widgets/customGrid.dart';
import 'package:movie/widgets/searchBar.dart';
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
  List topratedmovies = [];
  List tv = [];

  List<bool> _selections = List.generate(3, (i) => false);

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

  onItemChanged(v) async {
    Map search = await tmdbWithCustomLogs.v3.search
        .queryMovies(v.toString().toLowerCase());
    setState(() {
      newList = search['results'];
    });
    print("_____________________________________${newList}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        title: modified_text(
          text: 'Flutter Movie App❤️',
        ),
      ),
      body: ListView(
        children: [
          SearchMovies(onItemChanged: onItemChanged),
          addVerticalSize(),
          ToggleButtons(
            isSelected: _selections,
            onPressed: (int index) {
              setState(() {
                _selections[index] = !_selections[index];

                if (index == 0 && _selections[index]) {
                  newList = trendingmovies;
                } else if (index == 1 && !_selections[index]) {
                  newList = topratedmovies;
                } else if (index == 2 && !_selections[index]) {
                  newList = [];
                }
              });
            },
            children: [
              toggleButton(buttonName: "Most Popular"),
              toggleButton(buttonName: "Top Rated"),
              toggleButton(buttonName: "Reset"),
            ],
          ),
          showList(
              list: newList.isEmpty ? trendingmovies : newList,
              listname: newList == trendingmovies
                  ? "Trending Movies"
                  : newList.isEmpty
                      ? "Trending Movies"
                      : "Top Rated Movies"),
          showList(
              list: newList.isEmpty ? topratedmovies : newList,
              listname: newList == topratedmovies
                  ? "Top Rated Movies"
                  : newList.isEmpty
                      ? "Trending Movies"
                      : "Trending Movies"),
          TV(
            tv: newList.isEmpty ? tv : newList,
          ),
        ],
      ),
    );
  }

  toggleButton({required String buttonName}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33),
          border: Border.all(color: Colors.white)),
      child: modified_text(
        text: buttonName,
      ),
    );
  }

  showList({required List list, required String listname}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: listname,
            size: 26,
          ),
          addVerticalSize(),
          GridCustom(
            list: list,
            path: 'poster_path',
            namePath: 'title',
            mainHeight: 900.0,
          ),
        ],
      ),
    );
  }
}

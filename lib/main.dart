import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:movie/utils/text.dart';
import 'package:movie/viewModel/movie_vm.dart';
import 'package:movie/viewModel/popularMovieList_vm.dart';
import 'package:movie/widgets/customGrid.dart';
import 'package:movie/widgets/movieListPage.dart';
import 'package:movie/widgets/tv.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (context)=>PopularMovieListViewModel(),
          child: Home()),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatelessWidget {


  Home({Key? key}) : super(key: key);


  List<MovieViewModel> trendingmovies = [];
  List popularmovies = [];
  List topratedmovies = [];
  List tv = [];

   final List<bool>      _selections= List.generate(2, (i) => false);


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
              // SearchMovies(onItemChanged: onItemChanged),
              addVerticalSize(),
              ToggleButtons(
                isSelected: _selections,
                onPressed: (int index) {
                    _selections[index] = !_selections[index];

                    if (index == 0 && _selections[index]) {

                      newList = trendingmovies;
                    } else if (index == 1 && !_selections[index]) {
                      newList = topratedmovies;
                    }
                },
                children: [
                  toggleButton(buttonName: "Most Popular"),
                  toggleButton(buttonName: "Top Rated"),

                ],
              ),
              // showList(
              //     list:  vm.movies ??[] ,
              //     listname: newList == popularmovies
              //         ? "Most Popular Movies"
              //         : newList.isEmpty
              //         ? "Most Popular Movies"
              //         : "Top Rated Movies"),
Consumer<PopularMovieListViewModel>(
    builder: (context, vm,__) {

             return MovieListPage(vm: vm);}
)
              // showList(
              //     list: newList.isEmpty ? topratedmovies : newList,
              //     listname: newList == topratedmovies
              //         ? "Top Rated Movies"
              //         : newList.isEmpty
              //         ? "Trending Movies"
              //         : "Trending Movies"),
              // showList(
              //     list: newList.isEmpty ? trendingmovies : newList,
              //     listname: newList == trendingmovies
              //         ? "Trending Movies"
              //         : newList.isEmpty
              //         ? "Trending Movies"
              //         : "Top Rated Movies"),
              ,TV(
                tv: newList.isEmpty ? tv : newList,
              ),
            ],
          ),
    );
  }
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

  showList({required List<MovieViewModel> list, required String listname}) {
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


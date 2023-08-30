import 'package:flutter/material.dart';
import 'package:movie/utils/constant.dart';
import 'package:movie/model/MoviesResponse.dart';
import 'package:movie/utils/text.dart';
import 'package:movie/viewModel/MovieList_vm.dart';
import 'package:movie/widgets/movieList.dart';
import 'package:movie/widgets/searchMovie.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (context) => MovieListViewModel(), child: const Home()),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class Home extends StatefulWidget {
 const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<bool> _selections = List.generate(2, (i) => false);
  List<Movie> newList = [];
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
        body: Consumer<MovieListViewModel>(builder: (context, vm, __) {
          return ListView(
            shrinkWrap: true,
            children: [
              searchTextField(vm: vm),
              addVerticalSize(),
              filterMovieList(vm: vm),
              getMoviesList(
                vm: vm,
                movieList: vm.searchedMovies.isEmpty
                    ? vm.popularMovies
                    : vm.searchedMovies,
                context: context,
              ),
              getMoviesList(
                vm: vm,
                movieList: vm.searchedMovies.isEmpty
                    ? vm.topRatedMovies
                    : vm.searchedMovies,
                context: context,
              )
            ],
          );
        }));
  }

  Widget searchTextField({required MovieListViewModel vm}) {
    return SearchMovies(
      onTap: () {
        setState(() {
          vm.popularMovies = vm.searchedMovies;
          vm.topRatedMovies = vm.searchedMovies;
        });
      },
      onItemChanged: (v) {
        vm.fetchSearchedMovies(v.toString().toLowerCase());

        setState(() {});
        print(textController.text);
      },
      onSubmitted: (v) {
        setState(() {
          vm.popularMovies = vm.searchedMovies;
          vm.topRatedMovies = vm.searchedMovies;
        });
      },
      controller: textController,
    );
  }

  Widget filterMovieList({required MovieListViewModel vm}) {
    return ToggleButtons(
      isSelected: _selections,
      onPressed: (int index) {
        setState(() {
          _selections[index] = !_selections[index];
        });

        if (index == 0 && _selections[index]) {
          setState(() {
            vm.fetchMovies('iron man');
            vm.topRatedMovies = vm.popularMovies;
            newList = vm.popularMovies;
          });
        } else if (index == 1 && !_selections[index]) {
          setState(() {
            vm.fetchTopRatedMovies('iron man');
            vm.popularMovies = vm.topRatedMovies;
            newList = vm.topRatedMovies;
          });
        }
      },
      children: [
        toggleButton(buttonName: "Most Popular"),
        toggleButton(buttonName: "Top Rated"),
      ],
    );
  }

  Widget toggleButton({required String buttonName}) {
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

  Widget getMoviesList(
      {required MovieListViewModel vm,
      required List<Movie> movieList,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: MoviesListPage(
        vm: vm,
        movieList: movieList,
        mainHeight: 900.0,borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

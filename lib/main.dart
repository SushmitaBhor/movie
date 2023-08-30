import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:movie/model/popularMovies.dart';
import 'package:movie/utils/text.dart';
import 'package:movie/viewModel/popularMovieList_vm.dart';
import 'package:movie/widgets/customGrid.dart';
import 'package:movie/widgets/searchBar.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (context) => PopularMovieListViewModel(), child: Home()),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<bool> _selections = List.generate(2, (i) => false);

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
        body: Consumer<PopularMovieListViewModel>(builder: (context, vm, __) {
          return ListView(
            shrinkWrap: true,
            children: [
              SearchMovies(onItemChanged: (v){}),
              addVerticalSize(),
              ToggleButtons(
                isSelected: _selections,
                onPressed: (int index) {
                  setState((){
                    _selections[index] = !_selections[index];

                    if (index == 0 && _selections[index]) {
                      newList = vm.popularMovies;

                    } else if (index == 1 && !_selections[index]) {
                      newList = vm.topRatedMovies;
                    }
                  });
                },
                children: [
                  toggleButton(buttonName: "Most Popular"),
                  toggleButton(buttonName: "Top Rated"),

                ],
              ),

              showList(
                  vm: vm,
                  list:newList.isEmpty ? vm.popularMovies:newList,
                  listname: newList == vm.popularMovies
                      ? "Most Popular Movies"
                      : newList.isEmpty
                          ? "Most Popular Movies"
                          : "Top Rated Movies"),
              showList(
                  vm: vm,
                  list:newList.isEmpty? vm.topRatedMovies:newList,
                  listname: newList == vm.topRatedMovies
                      ? "Top Rated Movies"
                      : newList.isEmpty
                          ? "Trending Movies"
                          : "Trending Movies")
            ],
          );
        }));
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

showList(
    {required PopularMovieListViewModel vm, list, required String listname}) {
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
          vm: vm,
          list: list,
          mainHeight: 900.0,
        ),
      ],
    ),
  );
}

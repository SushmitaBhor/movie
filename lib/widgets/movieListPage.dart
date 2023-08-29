import 'package:flutter/material.dart';
import 'package:movie/viewModel/popularMovieList_vm.dart';

class MovieListPage extends StatefulWidget {
  PopularMovieListViewModel vm;
  MovieListPage({required this.vm});
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _controller = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.vm.fetchMovies('iron man');
  }

  @override
  Widget build(BuildContext context) {



    return  Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        widget.vm.fetchMovies(value);
                        _controller.clear();
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: widget.vm.popularMovies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
image: DecorationImage(image: NetworkImage(widget.vm.popularMovies[index].posterPath??"")),
                borderRadius: BorderRadius.circular(6)
            ),

            width: 50,
            height: 100,
          ),
                      title: Text(widget.vm.popularMovies[index].title  ??"no data"),
                    );
                  },
                )) //we will create this further down
              ]));

  }
}

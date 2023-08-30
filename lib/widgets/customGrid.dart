import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/description.dart';

import '../constant.dart';
import '../utils/text.dart';
import '../viewModel/popularMovieList_vm.dart';

class GridCustom extends StatefulWidget {
  PopularMovieListViewModel vm;
  List list;
  double height, width, mainHeight;
  BorderRadius borderRadius;
  GridCustom(
      {Key? key,
      this.width = 250.0,
       required this.list,
      this.height = 200.0,
      this.borderRadius = BorderRadius.zero,
      required this.vm,
      this.mainHeight = 800.0,
     })
      : super(key: key);

  @override
  State<GridCustom> createState() => _GridCustomState();
}

class _GridCustomState extends State<GridCustom> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.vm.fetchMovies('iron man');
    widget.vm.fetchTopRatedMovies('iron man');
  }
  @override
  Widget build(BuildContext context) {
    return grid();
  }

  grid() {
    return SizedBox(
      height: widget.mainHeight,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.vm.popularMovies.length,shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Description(
                          name: widget.vm.popularMovies[index].title!,
                          description: widget.vm.popularMovies[index].overview!,
                          bannerurl: widget.vm.popularMovies[index].posterPath.toString(),
                          posterurl: widget.vm.popularMovies[index].posterPath.toString(),
                          vote: widget.vm.popularMovies[index].voteAverage.toString()!,
                          launch_on: widget.vm.popularMovies[index].releaseDate!)));
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: widget.borderRadius,
                  child: CachedNetworkImage(
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.cover,
                    imageUrl:'http://image.tmdb.org/t/p/w500' +widget.vm.popularMovies[index].posterPath!,
                    placeholder: (context, url) =>
                        Center(child: new CircularProgressIndicator()),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                ),
                addVerticalSize(),
                Flexible(
                  child: Container(
                    width: 120,
                    child: modified_text(
                      text: widget.vm.popularMovies[index].title!,
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10),
      ),
    );
  }
}

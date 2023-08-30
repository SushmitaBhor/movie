import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/widgets/description.dart';

import '../model/MoviesResponse.dart';
import '../utils/constant.dart';
import '../utils/text.dart';
import '../viewModel/MovieList_vm.dart';

class MoviesListPage extends StatefulWidget {
  MovieListViewModel vm;
  List<Movie> movieList;
  double height, width, mainHeight;
  BorderRadius borderRadius;
  MoviesListPage(
      {Key? key,
      this.width = 250.0,
       required this.movieList,
      this.height = 200.0,
      this.borderRadius = BorderRadius.zero,
      required this.vm,
      this.mainHeight = 800.0,
     })
      : super(key: key);

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  @override
  void initState() {
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
        itemCount: widget.movieList.length,shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Description(
                          movie:widget.movieList[index])));
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: widget.borderRadius,
                  child: CachedNetworkImage(
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.cover,
                    imageUrl:"http://image.tmdb.org/t/p/w500${widget.movieList[index].posterPath}" ??"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAN0AAADSCAMAAAD5TDX9AAAAYFBMVEX19fWZmZkzMzOEhITZ2dnu7u5HR0dWVlahoaGysrJ7e3vW1ta7u7vc3NxOTk7f399dXV3Ly8upqam4uLg4ODhnZ2fp6ek/Pz+zs7N0dHSKiopubm7ExMSWlpbl5eWlpaUhZLfyAAAEYElEQVR4nO2c65KiMBBGQQdEAbmIoKLM+7/lGm6BkBZ0tibT1Hd+7Gqla+2zSToBg5YFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJjhhMkpTT3b9tL0lISO6Xz+I3mytxXSZCWC4UStYR+azuznRITbGvzyC+0muHAen773Wu5ZZHzTOX5MMOcmCExn+RnOixk3mn0cR2eeLpN7rg789JzFchz1JsMy6BWcyXzcm8z0A6YFZVAc/Ukjr9Iyzd9OZGsybeW0MDiade61nZeby/ZdTtP0Z+zsk7ls3yTSZD+0u+vaI3P5vod2Gb/Ldq0dl7oZ6pKftePSefod2KDo6/efPDrP0eY+b2ez2LHoKuIiu4T+N/8OxAZzUPKJS1oOQ5MYmAvsOAxNfcW07YsMoS78GNxmIabdcNxRdgwmnm4XpthRl34MrhSo1NO3Qv4qC1L/5mtH3eT7liGUnWcu66UQmQ/tyLuc5rJeCpX5oGMY21GpD+wW/Af8Vcg7fTKEimBQVX5gx2CjSa3m0o7aiXK4t0LtxOz+rpf2touAwU6M2kXb3r6FLJkMdtHkuJuHwRUQXVbmYFBUXky8ORhMO8vKieT7rwo0XzLUcBiY5MWpDNC3sxiYZNWUAfp2BhWzRt95sp1z11GdJ9tZdx1xS08261oZ7MI6dN9OvrbzeBTMBl3Rl62aRk7fLGu/KpCN0zYG9/pGTOvmi9WcTb3sWPdpnHWfpFr5KThr3ScYrZWfPn2OzpmTwyemo7Jjzae+BWs+sS9wVvy0RY0TJkH3pEywridlAAAAAAAAAAAAAAAAAABglM3Xb3/i1u2PcQfubPCmZffRZxmw2xy6lzq7/egMyvYaNVQffZYBu23RnVzT2d3GdodpxBsYsHukbtsTGjsnZm53s87X5mVr53hxke0e4pvHW1bPsv7HDUZ2gziZeLgR74/+1+GYFef2mEd1a95kJuyionkQubHL4/gURUG8q3t0R/bdOE6xe7i2X/mPrB70kXu+V+Fl923AbmtZ7dhs7A7nujeccyn+ou3GcYpd1hzb9+ra2kRY+dFEVXn+UdZjs7YLN+3Bmq/6BWmnxCl27ViPNpUIaNs8Q3ZRISRqu7RfymLxlKBit8ka9mqcYtc9PyrM+0jfkJ2VFlVrd7t2LQfRUYpd6Tfkapxi1y0ywq6PzE3ZWWXZ2snBV2dFjkwlTrHrzsQJOxlpzK4q0iV9J+2IvvOndn2kY8zO2hfRvZ53x65FN++knRLX1Zj71M6L2zfG5t2Ta5kIu0qpmaNHdAd2Spzb/t7RY2qXZO1eKDVoV7nber3bxsN1rLyNggfr3Tju2g5wd2pnxU2bszOzmjdcNrWdc94N9iBpEeRVf0UwtBvH+dk2qfz0aGvsfPea5FUQezuDdta13Wd+i/1j9xidd8zc/hdjxvvMUVxSFtnTwtHYtfvMu1X+uh0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMBq+Qcf9zKBTrP28AAAAABJRU5ErkJggg==",
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
                      text: widget.movieList[index].title!,
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10),
      ),
    );
  }
}

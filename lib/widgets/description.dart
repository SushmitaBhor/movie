import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/model/MoviesResponse.dart';
import 'package:movie/utils/constant.dart';
import 'package:movie/utils/text.dart';

import '../viewModel/MovieList_vm.dart';

class Description extends StatefulWidget {
final Movie movie;
  const Description(
      {Key? key,
      required this.movie})
      : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: modified_text(text: "${widget.movie.title} Overview")),
            backgroundColor: kbackgroundColor,
            body: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                children: [
                  SizedBox(
                      height: 250,
                      child: Stack(children: [
                        Positioned(
                            child: SizedBox(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'http://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                                  fit: BoxFit.cover,
                                  placeholder: (context, val) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ))),
                        Positioned(
                            bottom: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey),color: Colors.white),
                              child: modified_text(
                                  text: 'Average Rating\t - ${widget.movie.voteCount}', size: 18,color: Colors.grey,),
                            ))
                      ])),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: modified_text(
                      text: widget.movie.title ?? "Not Loaded",
                      size: 24,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: modified_text(
                          text: 'Releasing on\t-${widget.movie.releaseDate}', size: 14)),
                  addVerticalSize(),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Flexible(
                        flex: 2,
                        child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 200,
                            decoration:BoxDecoration(borderRadius: BorderRadius.circular(16)),
                            child: Image.network(
                                'http://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                                fit: BoxFit.cover,
                                alignment: Alignment.center))),
                    Flexible(
                        flex: 3,
                        child: modified_text(
                          text: widget.movie.overview ?? "no data found",
                          size: 18,
                        ))
                  ])
                ])));
  }
}

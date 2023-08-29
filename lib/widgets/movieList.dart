// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:movie/viewModel/popular_movie_vm.dart';
//
//
//
//
// class MovieList extends StatelessWidget {
//
//   final List<PopularMovieViewModel> popularMovies;
//
//   MovieList({ required this.popularMovies});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: popularMovies.length,
//       itemBuilder: (context, index) {
//
//         final popularMovie = popularMovies[index].popularMovies.results?[index] ;
// print(popularMovie?.posterPath);
//         return ListTile(
//           contentPadding: EdgeInsets.all(10),
// //           leading: Container(
// //             decoration: BoxDecoration(
// // image: DecorationImage(image: NetworkImage(popularMovie?.posterPath.toString(),),),
// //                 borderRadius: BorderRadius.circular(6)
// //             ),
// //
// //             width: 50,
// //             height: 100,
// //           ),
//           title: Text(popularMovie?.title??"loading"),
//         );
//       },
//     );
//   }
// }
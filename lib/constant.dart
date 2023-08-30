import 'package:flutter/material.dart';

import 'model/popularMovies.dart';


final String apiKey='91d7d40ef6cd4a35e4b291baa77dd09a';

final String apiReadAccessToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MWQ3ZDQwZWY2Y2Q0YTM1ZTRiMjkxYmFhNzdkZDA5YSIsInN1YiI6IjVkMDBlMGRhOTI1MTQxNDhhN2JiYmFjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IGeEdI1TTyd4ieuRkBKZoOsS37hp5sL4n_qJ12Abtl4';

final Color kbackgroundColor=Colors.black;

TextEditingController textController=TextEditingController();


addVerticalSize(){
  return const SizedBox(height: 10,);
}

addHorizontalSize(){
  return const SizedBox(width: 10,);
}


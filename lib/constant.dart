import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/text.dart';

final String apiKey='91d7d40ef6cd4a35e4b291baa77dd09a';

final String apiReadAccessToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MWQ3ZDQwZWY2Y2Q0YTM1ZTRiMjkxYmFhNzdkZDA5YSIsInN1YiI6IjVkMDBlMGRhOTI1MTQxNDhhN2JiYmFjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IGeEdI1TTyd4ieuRkBKZoOsS37hp5sL4n_qJ12Abtl4';

final Color kbackgroundColor=Colors.black;


addVerticalSize(){
  return const SizedBox(height: 10,);
}

addHorizontalSize(){
  return const SizedBox(width: 10,);
}

grid({list,path,namePath,height,width,mainHeight}){
  return Container(  height: mainHeight??800.0,
    child: GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context,index){
        return InkWell(
          onTap: (){

          },
          child: Column(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(   width: width ?? 250.0,
                 height: height??200.0,
                  fit: BoxFit.cover,
                  imageUrl: 'http://image.tmdb.org/t/p/w500'+list[index][path].toString(),
                  placeholder: (context, url) =>
                      Center(child: new CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  new Icon(Icons.error),
                ),
              ),
              addVerticalSize(),
              Flexible(
                child: Container(width: 120,
                  child: modified_text(
                    text:list[index][namePath]!=null?list[index][namePath]:'Loading',
                    size: 16,
                  ),
                ),
              )
            ],
          ),
        );
      }, gridDelegate:                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10),
    ),
  );
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:movie/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Trending Movies',size: 26,),
          addVerticalSize(),
          Container(  height: 800,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){

                  },
                  child: Container(width: 250,
                    child: Column(
                      children: [

                        Container(
                          width: 250,
height: 200,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: 'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path'].toString(),
                              placeholder: (context, url) =>
                                  Center(child: new CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                            ),
                          ),
                        ),
                        addVerticalSize(),
                        Flexible(
                          child: Container(width: 120,
                            child: modified_text(
                              text: trending[index]['title']!=null?trending[index]['title']:'Loading',
                              size: 16,align: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }, gridDelegate:                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10),
            ),
          ),

        ],
      ),
    );
  }
}

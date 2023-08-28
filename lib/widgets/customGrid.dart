import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../utils/text.dart';

class GridCustom extends StatelessWidget {
  List list;String namePath,path;double height, width,mainHeight;BorderRadius borderRadius;
   GridCustom({Key? key,this.width= 250.0,this.height=200.0,this.borderRadius=BorderRadius.zero,required this.list,this.mainHeight=800.0,required this.namePath,required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return grid();
  }
  grid(){
    return Container(  height: mainHeight,
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
                  borderRadius: borderRadius ,
                  child: CachedNetworkImage(   width: width ,
                    height: height,
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
}

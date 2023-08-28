import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:movie/utils/text.dart';

class Description extends StatelessWidget {
  final String name,description,bannerurl,posterurl,vote,launch_on;
  const Description({Key? key,required this.name,required this.description,required this.bannerurl,required this.posterurl,required this.vote,required this.launch_on}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Container(
        child:

        ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child:CachedNetworkImage(imageUrl: 'http://image.tmdb.org/t/p/w500' + posterurl ,fit: BoxFit.cover,
                      placeholder:(context,val)=>Center(child: CircularProgressIndicator(),),errorWidget: (context,url,error)=>const Icon(Icons.error),)
             )),
                  Positioned(
                      bottom: 10,
                      child: modified_text(text: 'Average Rating\t - '+vote,size: 18,))
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(padding: EdgeInsets.all(10),
            child: modified_text(text: name!=null?name:"Not Loaded",size: 14,),
            ),
            Container(padding: EdgeInsets.only(left: 10),child: modified_text(text: 'Releasing on\t-'+launch_on,size: 14,),)
         , Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network( 'http://image.tmdb.org/t/p/w500' +posterurl),
              ),
              Flexible(
                child: Container(
                  child: modified_text(text: description,size: 18,),
                ),
              )
            ],
          )
          ],
        ),
      ),
    );
  }
}

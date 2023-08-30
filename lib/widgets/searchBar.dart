import 'package:flutter/material.dart';
import '../constant.dart';

class SearchMovies extends StatefulWidget {
 void Function(String)? onItemChanged;
 void Function(String)? onSubmitted;
 void Function()? onTap;
 final TextEditingController  controller;
   SearchMovies({Key? key,this.onItemChanged,this.onSubmitted,required this.onTap,required this.controller}) : super(key: key);

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          controller: widget.controller,
          style:TextStyle(
              color: const Color(0xff666666),
              fontWeight: FontWeight.w300,
              fontSize: 16.0),
          decoration: InputDecoration(isDense: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              contentPadding: EdgeInsets.only(left: 20),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              suffixIcon: InkWell(
                onTap: widget.onTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 1,
                      height: 30,
                      color: const Color(0xffC5C5C5),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                        padding: const EdgeInsets.only(right: 17.0),
                        child: Icon(Icons.search,color: kbackgroundColor,)
                    )
                  ],
                ),
              ),

              hintText: 'Search',hintStyle: TextStyle(
                  color: const Color(0xff666666),
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0),
              filled: true,
              fillColor: const Color(0xffFBEEFE)),
          onChanged:widget.onItemChanged,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}

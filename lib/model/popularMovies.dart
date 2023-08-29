

class PopularMovies {
  int? _page;
  List<Result>? _results;
  int? _totalPages;
  int? _totalResults;

  PopularMovies({
     int? page,
List<Result>? results,
 int? totalPages,
    int? totalResults,
  });
  int? get page=>_page ;
  List<Result>? get results=> _results;
  int? get totalPages=>_totalPages;
  int? get totalResults=>_totalResults;

  PopularMovies.fromJson(Map<String,dynamic> json){
    _page = json['page'];
    if(json['results'] !=null){
      json['results'].forEach((v){
        _results?.map((e) => Result.fromJson(v)).toList();
        return _results;
      });
    _totalPages=json['total_pages'];
    _totalResults = json['total_results'];
  }}

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=new Map<String,dynamic>();
    data['page']=this._page;

    if(   data[this._results]!=null){
      data['genre_ids']=this._results!.map((e) =>e.toJson()).toList();
    }
    data['total_pages']=this._totalPages;
    data['total_results']=this._totalResults;
    return data;
  }
}

class Result {
  bool? _adult;
  String? _backdropPath;
  List<int>? _genreIds;
  int? _id;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  double? _popularity;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  double? _voteAverage;
  int? _voteCount;

  Result({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    String? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    String? video,
    double? voteAverage,
    String? voteCount,
  });
  bool? get adult=> _adult;
  String? get backdropPath=>_backdropPath;
  List<int>? get genreIds => _genreIds;
  int? get id =>_id;
  String? get originalLanguage=>_originalLanguage;
  String? get originalTitle=>_originalTitle;
  String? get overview=>_overview;
  double? get popularity=>_popularity;
  String? get posterPath=>_posterPath;
  String? get releaseDate=>_releaseDate;
  String? get title=>_title;
  bool? get video=>_video;
  double? get voteAverage => double.parse(_voteAverage.toString());
  int? get voteCount=>_voteCount;

  Result.fromJson(Map<String,dynamic> json){
    _adult=json['adult'];
_backdropPath=json['backdrop_path'];
if(json['genre_ids'] !=null){
json['genre_ids'].forEach((v){
  _genreIds?.map((e) => e).toList();
  return _genreIds;
});
_id=json['id'];
_originalLanguage=json['original_language'];
_originalTitle=json['original_title'];
_overview=json['overview'];
_popularity=json['popularity'];
_posterPath=json['poster_path'];
_releaseDate=json['release_date'];
_title=json['title'];
_video=json['video'];
_voteAverage=double.parse(json['vote_average'].toString());
_voteCount=json['vote_count'];
}
  }

  Map<String,dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult']=_adult;
    data['backdrop_path']=_backdropPath;
    if(   data[this._genreIds]!=null){
      data['genre_ids']=this._genreIds!.map((e) => e).toList();
    }
    data['id']=_id;
    data['original_language']=_originalLanguage;
    data['original_title']=_originalTitle;
    data['overview']=_overview;
    data['popularity']=_popularity;
    data['poster_path']=_posterPath;
    data['release_date']=_releaseDate;
    data['title']=_title;
    data['video']=_video;
    data['vote_average']=double.parse(_voteAverage.toString());
    data['vote_count']=_voteCount;
    return data;
  }
}

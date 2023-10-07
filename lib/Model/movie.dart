//create varials for movie class
class Movie {
  late String title;
  late String backdropPath;
  late String originalTitle;
  late String overview;
  late String posterPath;
  late String releaseDate;
  late double voteAverage;

  //create constructor for movie class
  Movie({
    required this.title,
    required this.backdropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> Json) {
    return Movie(
      title: Json["title"],
      backdropPath: Json["backdrop_path"],
      originalTitle: Json["original_title"],
      overview: Json["overview"],
      posterPath: Json["poster_path"],
      releaseDate: Json["release_date"],
      voteAverage: Json["vote_average"].toDouble(),
    );
  }
}

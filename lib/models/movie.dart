class Movie {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final String? overview;
  final double? voteAverage;
  final String? releaseDate;
  final List<String>? genres;
  Movie({
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.voteAverage,
    this.releaseDate,
    this.genres,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      voteAverage: json['vote_average']?.toDouble(),
      releaseDate: json['release_date'],
    );
  }
  String get posterUrl => posterPath != null 
      ? 'https://image.tmdb.org/t/p/w500$posterPath' 
      : 'https://via.placeholder.com/500x750?text=No+Image';
  String get backdropUrl => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w500$backdropPath'
      : 'https://via.placeholder.com/500x300?text=No+Image';
}
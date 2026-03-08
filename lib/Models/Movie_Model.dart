
class MovieModel {
  final int id;
  final String backdropPath;
  final String title;
  final String posterPath;
  final String description;
  final double voteAverage;
  final String releaseDate;
  final List<dynamic> genres;

  MovieModel({
    required this.id,
    required this.backdropPath,
    required this.description,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
  });

  factory MovieModel.fromMap(Map<String, dynamic> movie) {
    return MovieModel(
      id: movie["id"] ?? 0,
      backdropPath: movie['backdrop_path'] ?? "",
      description: movie["overview"] ?? "",
      title: movie["title"] ?? "",
      posterPath: movie["poster_path"]?? "",
      voteAverage: (movie["vote_average"] ?? 0).toDouble(),
      releaseDate: movie["release_date"] ?? "",
      genres: movie["genre_ids"] ?? "",
    );
  }
}

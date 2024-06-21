class TrendingMoviesModel {
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  TrendingMoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class Result {
  final String backdropPath;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final MediaType mediaType;
  final bool adult;
  final String title;
  final OriginalLanguage originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final DateTime releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Result({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.title,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}

enum MediaType { MOVIE }

enum OriginalLanguage { EN, FR, PL }

import 'dart:convert';

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

  factory TrendingMoviesModel.fromJson(Map<String, dynamic> json) {
    return TrendingMoviesModel(
      page: json['page'] ?? 0,
      results: List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': List<dynamic>.from(results.map((x) => x.toJson())),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
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

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? 0,
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: MediaType.values.firstWhere((e) => e.toString() == 'MediaType.${json['media_type']}'),
      adult: json['adult'] ?? false,
      title: json['title'] ?? '',
      originalLanguage: OriginalLanguage.values.firstWhere((e) => e.toString() == 'OriginalLanguage.${json['original_language']}'),
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      popularity: json['popularity']?.toDouble() ?? 0.0,
      releaseDate: DateTime.parse(json['release_date']),
      video: json['video'] ?? false,
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType.toString().split('.').last,
      'adult': adult,
      'title': title,
      'original_language': originalLanguage.toString().split('.').last,
      'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
      'popularity': popularity,
      'release_date': releaseDate.toIso8601String(),
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}

enum MediaType { MOVIE }

enum OriginalLanguage { EN, FR, PL }

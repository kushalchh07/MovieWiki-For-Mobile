import 'dart:convert';

class TrendingTvShowsModel {
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  TrendingTvShowsModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingTvShowsModel.fromJson(Map<String, dynamic> json) {
    return TrendingTvShowsModel(
      page: json['page'] ?? 0,
      results:
          List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
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
  final String originalName;
  final String overview;
  final String posterPath;
  final MediaType mediaType;
  final bool adult;
  final String name;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final DateTime firstAirDate;
  final double voteAverage;
  final int voteCount;
  final List<String> originCountry;

  Result({
    required this.backdropPath,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.name,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? 0,
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: MediaType.values
          .firstWhere((e) => e.toString() == 'MediaType.${json['media_type']}'),
      adult: json['adult'] ?? false,
      name: json['name'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      popularity: json['popularity']?.toDouble() ?? 0.0,
      firstAirDate: DateTime.parse(json['first_air_date']),
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      originCountry: List<String>.from(json['origin_country'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'original_name': originalName,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType.toString().split('.').last,
      'adult': adult,
      'name': name,
      'original_language': originalLanguage,
      'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
      'popularity': popularity,
      'first_air_date': firstAirDate.toIso8601String(),
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'origin_country': List<dynamic>.from(originCountry.map((x) => x)),
    };
  }
}

enum MediaType { TV }

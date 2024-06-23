import 'dart:convert';

class PopularTvShowsModel {
  final int page;
  final List<Res> results;
  final int totalPages;
  final int totalResults;

  PopularTvShowsModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularTvShowsModel.fromJson(Map<String, dynamic> json) {
    return PopularTvShowsModel(
      page: json['page'] ?? 0,
      results: (json['results'] as List<dynamic>?)
              ?.map((item) => Res.fromJson(item))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((item) => item.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

class Res {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  Res({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Res.fromJson(Map<String, dynamic> json) {
    return Res(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: (json['genre_ids'] as List<dynamic>?)
              ?.map((item) => item as int)
              .toList() ??
          [],
      id: json['id'] ?? 0,
      originCountry: (json['origin_country'] as List<dynamic>?)
              ?.map((item) => item as String)
              .toList() ??
          [],
      originalLanguage: json['original_language'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] ?? '',
      firstAirDate:
          DateTime.tryParse(json['first_air_date'] ?? '') ?? DateTime.now(),
      name: json['name'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'first_air_date': firstAirDate.toIso8601String(),
      'name': name,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
